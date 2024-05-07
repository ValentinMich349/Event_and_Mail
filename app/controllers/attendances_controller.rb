class AttendancesController < ApplicationController


    def index
      @attendances = Attendance.all
    end
        
    def show
      @attendance = Attendance.find(params[:id])
   end
        
   def new
     @attendance = Attendance.new
   end
        

end
