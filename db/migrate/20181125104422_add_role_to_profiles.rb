class AddRoleToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :role, :string, null: false, default: 'user'
    # rails g migration add_role_to_profiles role:string 이렇게 쳐줘야 올바르게 나온다.
    # profile라는 테이블에 role이라는 컬럼에 string을 추가.하는데 null이라는 값은 없으며, 기본값은 user이다.
  end
end
