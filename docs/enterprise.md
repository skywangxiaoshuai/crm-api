# Enterprise 企业

## 根据名字，编号，开发人员id和运营人员id查询企业
    登录 +，

    request:

    get /enterprises/search?code=1234&name=AAA&developer_id=4&page[number]=1

    response:

    200 ok

    {
      "data": [
        {
          "id": "1",
          "type": "enterprises",
          "attributes": {
            "name": "AAA",
            "developer": {
              "id": 4,
              "name": "userAAA"
            },
            "operator": {
              "id": 5,
              "name": "userBBB"
            },
            "district": {
              "1": {
                "id": "310000",
                "name": "上海市"
              },
              "2": {
                "id": "310115",
                "name": "浦东新区"
              }
            },
            "address": "fsdfasdf",
            "contact": "dsfasdfasd",
            "contact-position": "fasdfasdfasd",
            "contact-telephone": null,
            "contact-otherinfo": "fasdfasdf\nfsdfasdfasdfasdfasd\nsdfas              dfasd",
            "remarks": "sdafas\ndsfasdfasdfasd            fasdfasd\ndfasdfasdf",
            "pictures": [],
            "store-count": 2,
            "code": "1234"
          }
        }
      ],
      "links": {},
      "meta": {
        "total-count": 1
      }
    }


## 根据名字模糊筛选企业

    登录 +，

    request:

    get /enterprises/search?q=华为

    response:

    200 ok

    {
      "data": [
        {
          "id": "2",
          "type": "stores",
          "attributes": {
            "name": "华为科技"
          }
        },
        {
          "id": "1",
          "type": "stores",
          "attributes": {
            "name": "华为科技"
          }
        }
      ]
    }


## 返回所有企业

    request:

    GET /enterprises?page[number]=1

    response:

    200 ok

    {
      "data": [
        {
          "id": "2",
          "type": "enterprises",
          "attributes": {
            "name": "华为科技",
            "developer": {
              "id": 1,
              "name": "admin"
            },
            "operator": {
              "id": 1,
              "name": "admin"
            },
            "district": {
              "1": {
                "id": "110000",
                "name": "北京市"
              },
              "2": {
                "id": "110001",
                "name": "北京市"
              },
              "3": {
                "id": "110101",
                "name": "东城区"
              }
            },
            "address": "上海市浦东新区龙东大道3000号",
            "contact": "任正非",
            "contact-position": "CEO",
            "contact-otherinfo": "1101234567",
            "remarks": "测试更新这里是备注",
            "pictures": [
              {
                "id": 5,
                "url": "/system/pictures/5/pictures/s.jpg?1491978517"
              },
              {
                "id": 4,
                "url": "/system/pictures/4/pictures/s.jpg?1491978514"
              }
            ],
            "contact_telephone": "18678334918"
            "store-count": 7,
            "code": "abcdefg"
          }
        },
        {
          "id": "1",
          "type": "enterprises",
          "attributes": {
            "name": "华为科技",
            "developer": {
              "id": 1,
              "name": "admin"
            },
            "operator": {
              "id": 1,
              "name": "admin"
            },
            "district": {
              "1": {
                "id": "110000",
                "name": "北京市"
              },
              "2": {
                "id": "110001",
                "name": "北京市"
              },
              "3": {
                "id": "110101",
                "name": "东城区"
              }
            },
            "address": "上海市浦东新区龙东大道3000号",
            "contact": "任正非",
            "contact-position": "CEO",
            "contact-otherinfo": "1101234567",
            "remarks": "测试更新这里是备注",
            "pictures": [
              {
                "id": 5,
                "url": "/system/pictures/5/pictures/s.jpg?1491978517"
              },
              {
                "id": 4,
                "url": "/system/pictures/4/pictures/s.jpg?1491978514"
              }
            ],
            "contact_telephone": "18678334918"
            "store-count": 7,
            "code": "abcdefg"
          }
        }
      ],
      "links": {},
      "meta": {
        "total-count": 2
      }
    }

## 创建企业

    登录： +，

    request:

    request:

    POST /enterprises

    {
      "data": {
        "type": "ents",
        "attributes": {
        "code": "abcdefg",
        "developer_id": 1,
        "operator_id":1,
        "district": {
            "1": {"id": "110000", "name": "北京市"},
            "2": {"id": "110001", "name": "北京市"},
            "3": {"id": "110101", "name": "东城区"}
         },
        "name": "华为科技",
        "address": "上海市浦东新区龙东大道3000号",
        "contact": "任正非",
        "contact_position": "CEO",
        "contact_otherinfo": "1101234567",
        "contact_telephone": "18678334918"
        "remarks": "测试更新这里是备注",

        }
      }
    }

    response:

    201 created, 422 unprocessable_entity

    {
      "data": {
        "id": "2",
        "type": "enterprises",
        "attributes": {
          "name": "华为科技",
          "developer": {
            "id": 1,
            "name": "admin"
          },
          "operator": {
            "id": 1,
            "name": "admin"
          },
          "district": {
            "1": {
              "id": "110000",
              "name": "北京市"
            },
            "2": {
              "id": "110001",
              "name": "北京市"
            },
            "3": {
              "id": "110101",
              "name": "东城区"
            }
          },
          "address": "上海市浦东新区龙东大道3000号",
          "contact": "任正非",
          "contact-position": "CEO",
          "contact-otherinfo": "1101234567",
          "remarks": "测试更新这里是备注",
          "pictures": [
            {
              "id": 5,
              "url": "/system/pictures/5/pictures/s.jpg?1491978517"
            },
            {
              "id": 4,
              "url": "/system/pictures/4/pictures/s.jpg?1491978514"
            }
          ],
          "contact_telephone": "18678334918"
          "store-count": 7,
          "code": "abcdefg"
        }
      }
    }


## 查看企业信息

    request:

    GET /enterprises/:id

    response:

    200 ok

    {
      "data": {
        "id": "1",
        "type": "enterprises",
        "attributes": {
          "name": "华为科技",
          "developer": {
            "id": 1,
            "name": "admin"
          },
          "operator": {
            "id": 1,
            "name": "admin"
          },
          "district": {
            "1": {
              "id": "110000",
              "name": "北京市"
            },
            "2": {
              "id": "110001",
              "name": "北京市"
            },
            "3": {
              "id": "110101",
              "name": "东城区"
            }
          },
          "address": "上海市浦东新区龙东大道3000号",
          "contact": "任正非",
          "contact-position": "CEO",
          "contact-otherinfo": "1101234567",
          "remarks": "测试更新这里是备注",
          "pictures": [
            {
              "id": 5,
              "url": "/system/pictures/5/pictures/s.jpg?1491978517"
            },
            {
              "id": 4,
              "url": "/system/pictures/4/pictures/s.jpg?1491978514"
            }
          ],
          "contact_telephone": "18678334918"
          "store-count": 7,
          "code": "abcdefg"
        }
      }
    }

## 编辑更新企业

    request:

    GET /enterprises/:id/edit

    response:

    200 ok

    {
      "data": {
        "id": "1",
        "type": "enterprises",
        "attributes": {
          "name": "华为科技",
          "developer": {
            "id": 1,
            "name": "admin"
          },
          "operator": {
            "id": 1,
            "name": "admin"
          },
          "district": {
            "1": {
              "id": "110000",
              "name": "北京市"
            },
            "2": {
              "id": "110001",
              "name": "北京市"
            },
            "3": {
              "id": "110101",
              "name": "东城区"
            }
          },
          "address": "上海市浦东新区龙东大道3000号",
          "contact": "任正非",
          "contact-position": "CEO",
          "contact-otherinfo": "1101234567",
          "remarks": "测试更新这里是备注",
          "pictures": [
            {
              "id": 5,
              "url": "/system/pictures/5/pictures/s.jpg?1491978517"
            },
            {
              "id": 4,
              "url": "/system/pictures/4/pictures/s.jpg?1491978514"
            }
          ],
          "contact_telephone": "18678334918"
          "store-count": 7,
          "code": "abcdefg"
        }
      }
    }

    request:

    PUT /enterprises/:id

    {
      "data": {
        "type": "ents",
        "attributes": {
        "code": "abcdefg",
        "developer_id": 1,
        "operator_id":1,
        "district": {
            "1": {"id": "110000", "name": "北京市"},
            "2": {"id": "110001", "name": "北京市"},
            "3": {"id": "110101", "name": "东城区"}
         },
        "name": "华为科技",
        "address": "上海市浦东新区龙东大道3000号",
        "contact": "任正非",
        "contact_position": "CEO",
        "contact_otherinfo": "1101234567",
        "contact_telephone": "18678334918"
        "remarks": "测试更新这里是备注"

        }
      }
    }

    response:

    200 ok, 422 unprocessable_entity

    {
      "data": {
        "id": "1",
        "type": "enterprises",
        "attributes": {
          "name": "华为科技",
          "developer": {
            "id": 1,
            "name": "admin"
          },
          "operator": {
            "id": 1,
            "name": "admin"
          },
          "district": {
            "1": {
              "id": "110000",
              "name": "北京市"
            },
            "2": {
              "id": "110001",
              "name": "北京市"
            },
            "3": {
              "id": "110101",
              "name": "东城区"
            }
          },
          "address": "上海市浦东新区龙东大道3000号",
          "contact": "任正非",
          "contact-position": "CEO",
          "contact-otherinfo": "1101234567",
          "remarks": "测试更新这里是备注",
          "pictures": [
            {
              "id": 5,
              "url": "/system/pictures/5/pictures/s.jpg?1491978517"
            },
            {
              "id": 4,
              "url": "/system/pictures/4/pictures/s.jpg?1491978514"
            }
          ],
          "contact_telephone": "18678334918"
          "store-count": 7,
          "code": "abcdefg"
        }
      }
    }

## 删除企业

    request:

    DELETE /enterprises/:id

    response:

    204 no_content
