require 'bcrypt'

class UsersController < ApplicationController
  include BCrypt
  # GET /users
  # GET /users.json
  skip_before_filter :require_user, :only =>:login

  def login
    if request.post? 
      #redirect to root url with flash
      form_user = params[:user] 
      user = User.where(:email=>form_user[:email]).first;
      
      if user.password != form_user[:password]
        user = nil
      end

      if user != nil
        puts "setting user in sesssion"
        session[User.sessionSymbol] = user.id
        redirect_to root_path
      else
        @error = 'Could not authenticate user'
      end 
    end
  end

  def logout
    session[User.sessionSymbol] = nil
    @user = nil
  end

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def signin
    if @user = User.find(:name=>params[:name], :password=>params[:password])
      session[:current_uid] = user.id
    end

  end
end
