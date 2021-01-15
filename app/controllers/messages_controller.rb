class MessagesController < ApplicationController
  before_action :authenticate_user

  def index
    query = "SELECT *
    FROM contacts WHERE receive_id = ? OR send_id = ?
    ORDER BY updated_at DESC"
    @contacts = Contact.find_by_sql([query, @current_user.id, @current_user.id])
  end

  def new
    @receive_user = User.find_by(id: params[:user_id])
  end

  def create
    receive_user_id = params[:user_id]
    @message = Message.new(
      send_id: @current_user.id,
      receive_id: receive_user_id,
      content: params[:content]
    )
    @contact = Contact.find_by(send_id: receive_user_id, receive_id: @current_user.id)
    if (@contact == nil)
      @contact = Contact.find_by(send_id: @current_user.id, receive_id: receive_user_id)
    end
    if (@contact == nil)
      @contact = Contact.new(send_id: @current_user.id, receive_id: receive_user_id)
    else
      @contact.send_id = @current_user.id
      @contact.receive_id = receive_user_id
    end
    if @message.save && @contact.save
      flash[:notice] = "メッセージを送信しました"
      redirect_to("/messages/#{params[:user_id]}")
    else
      render("messages/new")
    end
  end

  def show
    @messages = Message.where(
      send_id: @current_user.id, receive_id: params[:user_id])
    .or(Message.where(receive_id: @current_user.id, send_id: params[:user_id]))
    .order(created_at: :desc)
  end
end
