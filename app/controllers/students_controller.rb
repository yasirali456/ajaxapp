class StudentsController < ApplicationController
	def index
    @students = Student.all
    @student = Student.new
	end
	def new
    @student = Student.new
	end
	def create
	  @student = Student.new(student_params)
	  respond_to do |format|
	  	if @student.save
	  	   format.html { redirect_to @student, notice: "student was successfully created." }
	  	   format.js
	  	else
	  		format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end
    def update

    	respond_to do|format|
    		# binding.pry
    		set_student
    	  if @student.update(student_params)
    	  	# binding.pry
    	  	# set_studentSS
    	  	format.html { redirect_to @student, notice: "Student was successfully updated." }
        	format.json { render :show, status: :ok, location: @student }
        	format.js
          else
        	format.html { render :edit, status: :unprocessable_entity }
        	format.json { render json: @student.errors, status: :unprocessable_entity }
          end
        end
    end
    def destroy
    	# binding.pry
    	set_student
    	@student.destroy
    	respond_to do|format|
    		format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      		format.json { head :no_content }
      		format.js 
      	end
    end
    def show
    	set_student
    end
    def edit
    	set_student
      
    end

	private
	  def set_student
      	@student = Student.find(params[:id])
      end 
      def student_params
        params.require(:student).permit(:name, :f_name)
      end
end
	
