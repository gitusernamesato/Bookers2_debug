class EventsController < ApplicationController
   def index
      @contact = Contact.new
    end
   
    def confirm
      @contact = Contact.new(contact_params)
      if @event.valid?
        render :action => 'confirm'
      else
        render :action => 'index'
      end
    end

    def done
      @event = Event.new(ecent_params)
      if params[:back]
        render :action => 'index'
      else
        EventMailer.send_mail(@event).deliver_now
        render :action => 'done'
      end
    end

    private
      def event_params
        params.require(:event).permit(:title, :content)
      end
end
