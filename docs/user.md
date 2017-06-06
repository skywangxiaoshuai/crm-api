
# 用户

## 返回一个角色下的所有用户

		登录 +，

		request:

		GET /users/super_admin  // 返回所有超级管理员

		GET /users/operation_supervisor   // 返回所有运营主管

		GET /users/operation_specialist   //  返回所有运营专员

		GET /users/BD_supervisor    // 返回所有BD主管

		GET /users/BD_specialist    // 返回所有BD专员

		GET /users/data_admin 		// 返回所有数据管理员

		response:

		200 ok

		{
		  "data": [
		    {
		      "id": "2",
		      "type": "users",
		      "attributes": {
		        "name": "zhangsan",
		        "role": [
		          "BD_specialist"
		        ]
		      }
		    },
		    {
		      "id": "3",
		      "type": "users",
		      "attributes": {
		        "name": "lisi",
		        "role": [
		          "BD_specialist"
		        ]
		      }
		    }
		  ]
		}

## 返回所有用户

		登录 +， 角色 + （超级管理员），

		request:

		GET /users?page[number]=1&page[size]=3

		response:

		200 ok

		{
		  "data": [
		    {
		      "id": "1",
		      "type": "users",
		      "attributes": {
		        "name": "小寇"
		      }
		    },
		    {
		      "id": "2",
		      "type": "users",
		      "attributes": {
		        "name": "大寇"
		      }
		    },
		    {
		      "id": "3",
		      "type": "users",
		      "attributes": {
		        "name": "中寇"
		      }
		    }
		  ],
		  "links": {
		    "self": "http://192.168.0.23:3000/users?page%5Bnumber%5D=1&page%5Bsize%5D=3",
		    "next": "http://192.168.0.23:3000/users?page%5Bnumber%5D=2&page%5Bsize%5D=3",
		    "last": "http://192.168.0.23:3000/users?page%5Bnumber%5D=2&page%5Bsize%5D=3"
		  },
		  "meta": {
		    "total-count": 4
		  }
		}


## 新建用户

		登录 +， 角色 + （超级管理员），

		request:

		POST /users

		{
		  "data": {
		    "type": "users",
		    "attributes": {
		    "name": "小寇",
				"password": "123456",
		    "password_confirmation": "123456",
		    "role": "super_admin"
		    }
		  }
		}

		response:

		201 created, 422 unprocessable_entity

		{
		  "data": {
		    "id": "6",
		    "type": "users",
		    "attributes": {
		      "name": "小寇",
					"role": "super_admin"
		    }
		  }
		}


## 编辑用户信息

		登录 +， 角色 + （超级管理员），

		request:

		GET /users/:id/edit

		response:

		200 ok

		{
		  "data": {
		    "id": "6",
		    "type": "users",
		    "attributes": {
		      "name": "小寇",
					"role": "super_admin"
		    }
		  }
		}

		request:

		PUT /users/:id

		{
		  "data": {
		    "type": "users",
		    "attributes": {
		      "name": "小xiao明",
					"role": "operation_supervisor"
		    }
		  }
		}

		response:

		200 ok, 422 unprocessable_entity

		{
		  "data": {
		    "id": "5",
		    "type": "users",
		    "attributes": {
		      "name": "小xiao明",
					"role": "operation_supervisor"
		    }
		  }
		}


## 删除用户

		登录 +， 角色 + （超级管理员），

		request:

		DELETE /users/:id

		response:

		204 no_content


## 修改密码

		登录 +， 角色 +

		request:

		PUT /users/:id/reset_password

		{
		  "data": {
		    "type": "users",
		    "attributes": {
		    "old_password": "123456",  # 老密码
		    "password": "234567",  # 新密码
		    "password_confirmation": "234567"
		    }
		  }
		}

		response:

		200 ok, 422 unprocessable_entity

		{
			"data": {
				"id": "5",
				"type": "users",
				"attributes": {
					"name": "小xiao明",
					"role": []
				}
			}
		}

## 初始化密码

		登录 +， 角色 +

		request:

		PUT /users/:id/init_password

		response:

		200 ok, 422 unprocessable_entity

		{
			"data": {
				"id": "5",
				"type": "users",
				"attributes": {
					"name": "小xiao明",
					"role": []
				}
			}
		}


## 登陆

		request:

		POST /login

		{
			"data": {
				"type": "users",
				"attributes": {
				"name": "张三feng",  
				"password": "123456"
				}
			}
		}

		response:

		201 created  422 unprocessable_entity

## 获取当前用户

		登录 +

		request

		GET /current_user

		response

		200 ok

		{
		  "data": {
		    "id": "23",
		    "type": "users",
		    "attributes": {
		      "name": "张三feng",
		      "role": [
		        "super_admin"
		      ]
		    }
		  }
		}
