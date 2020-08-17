class Api::V1::JobsController < ApplicationController

    before_action :authenticate, :only => [:index, :create]

    def index
        if current_user
            render :json => current_user.jobs.as_json(:except => [:id, :user_id])
        else
            render :json => { message: 'Must be logged in to see jobs' }
        end
    end

    def create
        if current_user
            job = Job.new(job_params)
            job.user = current_user
            if job.save
                render :json => job.as_json(:except => [:id, :user_id]), :status => :ok
            else
                render :json => { message: job.errors.full_messages.join(', ') }, :status => :bad_request
            end
        else
            render :json => { message: 'Must be logged in to create a job' }
        end
    end

    private

    def job_params
        params.require(:job).permit(:job_title, :company, :link, :status)
    end

end
