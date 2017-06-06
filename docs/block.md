
# Block 商圈

## 根据名字,地区和描述模糊查询商圈，有分页
    /返回数据库中所有的商圈信息 (q=)

    登录 +，

    request:

    get /block?q=川沙&page[number]=1&block_district[level]=2&block_district[id]=310115

    response:

    200 ok

    {
      "data": [
        {
          "id": "16",
          "type": "blocks",
          "attributes": {
            "code": "422517625",
            "name": "川161752沙",
            "description": "川沙",
            "developer": null,
            "operator": {
              "id": 3,
              "name": "admin"
            },
            "district": {
              "1": {
                "id": "310000",
                "name": "上海市"
              },
              "2": {
                "id": "310115",
                "name": "浦东新区"
              },
              "3": {
                "id": "138",
                "name": "张江镇"
              }
            }
          }
        }
      ],
      "links": {},
      "meta": {
        "total-count": 1
      }
    }

## 根据名字模糊筛选商圈， 没有分页

    登录 +，

    request:

    get /blocks/search?q=华为

    response:

    200 ok

    {
      "data": [
        {
          "id": "2",
          "type": "blocks",
          "attributes": {
            "name": "华为科技"
          }
        },
        {
          "id": "1",
          "type": "blocks",
          "attributes": {
            "name": "华为科技"
          }
        }
      ]
    }

## 返回用户的商圈信息

	request:

	GET /users/:user_id/blocks?page[number]=1&page[size]=2

	response:

	200 ok

	{
	  "data": [
	    {
	      "id": "2",
	      "type": "blocks",
	      "attributes": {
	        "code": "4815",
	        "name": "川沙",
	        "description": "这是老寇的地盘"
	      }
	    },
	    {
	      "id": "3",
	      "type": "blocks",
	      "attributes": {
	        "code": "4815",
	        "name": "川沙",
	        "description": "这是老寇的地盘"
	      }
	    }
	  ]
	}

## 创建商圈

	request:

	POST /blocks

	{
	  "data": {
	    "type": "blocks",
	    "attributes": {
	    "developer_id": 2,
	    "operator_id": 5,
	    "name": "川沙",
	    "code": "4815",
	    "description": "川沙",
      "district":{
        "1": {"id": "310000", "name": "上海市"},
        "2": {"id": "310115", "name": "浦东新区"},
        "3": {"id": "138", "name": "张江镇"}
      }
	    }
	  }
	}

	response:

	201 created, 422 unprocessable_entity

	{
	  "data": {
	    "id": "4",
	    "type": "blocks",
	    "attributes": {
	      "code": "4815",
	      "name": "川沙",
	      "description": "川沙",
	      "developer": {
	        "id": 2,
	        "name": "张三"
	      },
	      "operator": {
	        "id": 5,
	        "name": "王五"
	      },
        "district": {
          "1": {
            "id": "310000",
            "name": "上海市"
          },
          "2": {
            "id": "310115",
            "name": "浦东新区"
          },
          "3": {
            "id": "138",
            "name": "张江镇"
          }
        }        
	    }
	  }
	}

## 编辑商圈

	request:

	GET /blocks/:id/edit

	response:

	200 ok

  {
    "data": {
      "id": "16",
      "type": "blocks",
      "attributes": {
        "code": "422517625",
        "name": "川161752沙",
        "description": "川沙",
        "developer": null,
        "operator": {
          "id": 3,
          "name": "admin"
        },
        "district": {
          "1": {
            "id": "310000",
            "name": "上海市"
          },
          "2": {
            "id": "310115",
            "name": "浦东新区"
          },
          "3": {
            "id": "138",
            "name": "张江镇"
          }
        }
      }
    }
  }


	request:

	PUT /blocks/:id

  {
    "data": {
      "type": "blocks",
      "attributes": {
      "developer_id": 2,
      "operator_id": 3,
      "name": "川161752沙",
      "code": "422517625",
      "description": "川沙",
      "district":{
          "1": {"id": "310000", "name": "上海市"},
          "2": {"id": "310115", "name": "浦东新区"},
          "3": {"id": "138", "name": "张江镇"}
        }
      }
    }
  }

	response:

	200 ok, 422 unprocessable_entity

  {
    "data": {
      "id": "16",
      "type": "blocks",
      "attributes": {
        "code": "422517625",
        "name": "川161752沙",
        "description": "川沙",
        "developer": null,
        "operator": {
          "id": 3,
          "name": "admin"
        },
        "district": {
          "1": {
            "id": "310000",
            "name": "上海市"
          },
          "2": {
            "id": "310115",
            "name": "浦东新区"
          },
          "3": {
            "id": "138",
            "name": "张江镇"
          }
        }
      }
    }
  }



## 删除商圈

	request:

	DELETE /blocks/:id

	response:

	204 no_content
