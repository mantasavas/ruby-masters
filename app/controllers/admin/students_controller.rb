module Admin
  class StudentsController < AdministrationController
    expose(:students) { users_group ? users_group.users : User.all }
    expose(:student, scope: -> { students })
    expose(:users_group) { Learning::UsersGroup.find_by(id: params[:users_group_id]) }
    expose(:user_groups) { Learning::UsersGroup.all }
    expose(:leaf_topics) { Learning::Topic.where.not(id: Learning::Topic.pluck(:parent_topic_id).uniq) }

    def index; end
    def edit; end

    def update
      student.update!(student_params)
      redirect_to admin_students_path
    end

    def destroy
      student.destroy
      redirect_to admin_students_path
    end

    private

    def student_group
      Learning::StudentGroup.find(params[:student_group_id])
    end

    def student_params
      params.require(:student).permit(:first_name, :last_name)
    end
  end
end
