module Events
    class Create
      attr_accessor :result, :errors
      def initialize(params)
        @issue = Issue.find_or_initialize_by(number: params[:issue][:number])
        @issue.assign_attributes(github_id: params[:issue][:id])
        @errors = Hash.new
        @event = Event.new(issue: @issue, action: params[:event][:action]) if params[:event]
      end
  
      def call
        ActiveRecord::Base.transaction do
          @issue.save!
          @event.save!
          @result = @event
        rescue  ActiveRecord::RecordInvalid => e
          @errors[:event] = @event.errors.to_hash if @event.errors.any?
          @errors[:issue] = @issue.errors.to_hash if @issue.errors.any?
          raise ActiveRecord::Rollback
        end
      end
  
      def success?
        @event.persisted?
      end
    end
end