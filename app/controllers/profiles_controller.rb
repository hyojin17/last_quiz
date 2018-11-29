class ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update]
    before_action :write_profile, except: [:new, :create]
    
    def new
        redirect_to edit_profile_url if !current_user.profile.nil?
        @profile = Profile.new
    end
    
    def create
        @profile = Profile.new(profile_params)
        @profile.address = convert_address
        @profile.user = current_user
        if @profile.save
            redirect_to my_profile_url
        else
            render 'new'
        end
        
    end
    
    def show
        @user=current_user
    end
    
    def edit
    end
    
    def update
    @profile.address = convert_address
        
       if @profile.update(profile_params)
           redirect_to my_profile_url
           #redirect_to는 path말고 url이라고 써줘야.
       else
           render 'edit'#edit은 edit.html.erb파일을 의미.
           #실패하면 edit화면만 보여줘라는 뜻
       end
    end
    
    private
    def set_profile
        @profile = current_user.profile
    end
    
    def profile_params
        params.require(:profile).permit(:name, :mobile, :birth)
    end
    
    def write_profile
        redirect_to new_profile_url if current_user.profile.nil?
    end
    
    def convert_address
        address = ''
       params[:profile][:address].each_value do |v|
           address += "#{v}/ " 
       end
       return address
    end
    
end
