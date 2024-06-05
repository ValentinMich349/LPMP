class StaticPagesController < ApplicationController

    def about
    end

    def contact
        @message = Message.new
    end

    def create_contact
      @message = Message.new(message_params)
      if @message.save
        flash[:notice] = "Message envoyé avec succès!"
        redirect_to contact_path
      else
        flash[:alert] = "Erreur lors de l'envoi du message."
        render :contact
      end
    end

        private

  def message_params
    params.require(:message).permit(:name, :email, :message)
  end
end
