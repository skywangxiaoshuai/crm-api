
# Store 商铺

## 多条件查询

    登录 +，

    request:

    get /stores?page[number]=1&store_district[level]=1&store_district[id]=810000
    &store_category[level]=&store_category[id]=&code=&name=&developer_id=&
    operator_id=&block_id=

    response:

    200 ok

    {
      "data": [
        {
          "id": "9",
          "type": "stores",
          "attributes": {
            "name": "eee",
            "operator": {
              "id": 5,
              "name": "userBBB"
            },
            "developer": {
              "id": 6,
              "name": "userCCC"
            },
            "block": {
              "id": 2,
              "name": "222"
            },
            "address": "sdffasdfasd",
            "contact": "fdsfasd",
            "contact-position": "fsdafasdf",
            "contact-otherinfo": "sdafsdafasdfasdfasd",
            "contact-telephone": null,
            "product": "123456",
            "remarks": "gsdafsdafasdf",
            "district": {
              "1": {
                "id": "810000",
                "name": "香港特别行政区"
              }
            },
            "category": {
              "1": {
                "id": "200000",
                "name": "医疗"
              },
              "2": {
                "id": "200300",
                "name": "私立/民营医院/诊所"
              }
            },
            "enterprise": {
              "id": 4,
              "name": "BBB"
            },
            "pictures": [
              {
                "id": 49,
                "url": "/system/pictures/49/pictures/s.jpg?1492499553"
              },
              {
                "id": 51,
                "url": "/system/pictures/51/pictures/s.jpg?1492499664"
              }
            ],
            "code": "eeeeee",
            "town-name": "沪东新村街道"
          }
        },
        {
          "id": "6",
          "type": "stores",
          "attributes": {
            "name": "DDD",
            "operator": {
              "id": 6,
              "name": "userCCC"
            },
            "developer": {
              "id": 6,
              "name": "userCCC"
            },
            "block": {
              "id": 3,
              "name": "333"
            },
            "address": "fsdfsdgsdfsdfasdf",
            "contact": "fasdf",
            "contact-position": "sgdsfsda",
            "contact-otherinfo": "fsdafasdf",
            "contact-telephone": null,
            "product": null,
            "remarks": "asdfasdfsdfasdfasd",
            "district": {
              "1": {
                "id": "810000",
                "name": "香港特别行政区"
              }
            },
            "category": {
              "1": {
                "id": "130000",
                "name": "餐饮/食品"
              },
              "2": {
                "id": "130200",
                "name": "餐饮"
              }
            },
            "enterprise": {
              "id": 4,
              "name": "BBB"
            },
            "pictures": [
              {
                "id": 42,
                "url": "/system/pictures/42/pictures/s.jpg?1492496514"
              }
            ],
            "code": null,
            "town-name": "沪东新村街道"
          }
        }
      ],
      "links": {},
      "meta": {
        "total-count": 2
      }
    }
## 根据名字模糊筛选商铺

    登录 +，

    request:

    get /stores/search?q=华为

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

<!-- ## 商铺筛选    

    # 只根据地区筛选店铺
    GET /district/stores?level=3&id=110101&page[number]=1&page[size]=10

    # 只根据类别筛选店铺
    GET /district/stores?level=3&id=120112&page[number]=1&page[size]=10

    request:

    # 同时根据地区和类别筛选店铺
    GET /stores?district_lev=3&district_id=110101&category_lev=3&category_id=120112&page[number]=1&page[size]=10

    # 只根据地区筛选店铺
    GET /stores?district_lev=3&district_id=110101&page[number]=1&page[size]=10

    # 只根据类别筛选店铺
    GET /stores?category_lev=3&category_id=120112&page[number]=1&page[size]=10

    # 没有筛选条件，返回所有商铺
    GET /stores?page[number]=1&page[size]=10

    response:

    200 ok

    {
      "data": [
        {
          "id": "2",
          "type": "stores",
          "attributes": {
            "name": "华为科技",
            "operator": {
              "id": 1,
              "name": "admin"
            },
            "developer": {
              "id": 1,
              "name": "admin"
            },
            "block": {
              "id": 1,
              "name": "川沙"
            },
            "address": "上海市浦东新区龙东大道3000号",
            "product": "经营范围：男装",
            "contact": "任正非",
            "contact-position": "CEO",
            "contact-otherinfo": "1101234567",
            "contact-telephone": "18678334918",
            "remarks": "测试更新这里是备注",
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
            "category": {
              "1": {
                "id": "120001",
                "name": "休闲娱乐"
              },
              "2": {
                "id": "120106",
                "name": "足疗按摩"
              },
              "3": {
                "id": "120112",
                "name": "修脚"
              }
            },
            "enterprise": null,
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
            "code": "abcdefg"
          }
        },
        {
          "id": "1",
          "type": "stores",
          "attributes": {
            "name": "华为科技",
            "operator": {
              "id": 3,
              "name": "张三"
            },
            "developer": {
              "id": 2,
              "name": "赵六"
            },
            "block": {
              "id": 1,
              "name": "川沙"
            },
            "address": "上海市浦东新区龙东大道3000号",
            "product": "经营范围：男装",
            "contact": "任正非",
            "contact-position": "CEO",
            "contact-otherinfo": "1101234567",
            "contact-telephone": "18678334918",
            "remarks": "测试更新这里是备注",
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
            "category": {
              "1": {
                "id": "120001",
                "name": "休闲娱乐"
              },
              "2": {
                "id": "120106",
                "name": "足疗按摩"
              },
              "3": {
                "id": "120112",
                "name": "修脚"
              }
            },
            "enterprise": null,
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
            "code": "abcdefg"
          }
        }
      ],
      "links": {},
      "meta": {
        "total-count": 2
      }
    } -->

## 查看商铺信息

    request:

    GET /stores/:id

    response:

    200 ok

    {
      "data": {
        "id": "1",
        "type": "stores",
        "attributes": {
          "name": "华为科技",
          "product": "男装",
          "operator": {
            "id": 1,
            "name": "admin"
          },
          "developer": {
            "id": 1,
            "name": "admin"
          },
          "block": {
            "id": 1,
            "name": "川沙"
          },
          "address": "上海市浦东新区龙东大道3000号",
          "contact": "任正非",
          "contact-position": "CEO",
          "contact-otherinfo": "1101234567",
          "contact-telephone": "18678334918",
          "remarks": "测试更新这里是备注",
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
          "category": {
            "1": {
              "id": "120001",
              "name": "休闲娱乐"
            },
            "2": {
              "id": "120106",
              "name": "足疗按摩"
            },
            "3": {
              "id": "120112",
              "name": "修脚"
            }
          },
          "enterprise": null,
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
          "code": "abcdefg",
          "town-name": "沪东新村街道"
        }
      }
    }

## 创建商铺

    request:

    POST /stores

    {
      "data": {
        "type": "stores",
        "attributes": {
        "code": "abcdefg",
        "developer_id": 1,   // BD专员的id
        "enterprise_id": 1,   // 所属企业的id， 如果所属企业不为空，传给企业的id，如果没有所属企业，则把该字段置为0.
        "operator_id":1,    // 运营专员的id
        "block_id": 1,    // 所属区块id
        "category": {
            "1": {"id": "120001", "name": "休闲娱乐"},
            "2": {"id": "120106", "name": "足疗按摩"},
            "3": {"id": "120112", "name": "修脚"}
         },
        "district": {
            "1": {"id": "110000", "name": "北京市"},
            "2": {"id": "110001", "name": "北京市"},
            "3": {"id": "110101", "name": "东城区"}
         },
        "name": "华为科技",
        "product": "男装", //经营范围
        "address": "上海市浦东新区龙东大道3000号",
        "contact_telephone": "18678334918",
        "contact": "任正非",
        "contact_position": "CEO",    // 联系人职位
        "contact_otherinfo": "1101234567",
        "remarks": "测试更新这里是备注"

        }
      }
    }

    response:

    201 created, 422 unprocessable_entity

    {
    "data": {
      "id": "1",
      "type": "stores",
      "attributes": {
        "name": "华为科技",
        "operator": {   
          "id": 1,
          "name": "admin"
        },
        "developer": {
          "id": 1,
          "name": "admin"
        },
        "block": {
          "id": 1,
          "name": "川沙"
        },
        "address": "上海市浦东新区龙东大道3000号",
        "contact": "任正非",
        "contact-position": "CEO",
        "contact-otherinfo": "1101234567",
        "contact-telephone": "18678334918",
        "remarks": "测试更新这里是备注",
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
        "category": {
          "1": {
            "id": "120001",
            "name": "休闲娱乐"
          },
          "2": {
            "id": "120106",
            "name": "足疗按摩"
          },
          "3": {
            "id": "120112",
            "name": "修脚"
          }
        },
        "enterprise": {
          "id": 1,
          "name": "华为科技"
        },
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
        "code": "abcdefg",
        "town-name": "沪东新村街道"
      }
    }
  }

## 更新商铺信息

    request:

    GET /stores/:id/edit

    response:

    200 ok

    {
      "data": {
        "id": "1",
        "type": "stores",
        "attributes": {
          "name": "华为科技",
          "product": "男装",
          "operator": {
            "id": 1,
            "name": "admin"
          },
          "developer": {
            "id": 1,
            "name": "admin"
          },
          "block": {
            "id": 1,
            "name": "川沙"
          },
          "address": "上海市浦东新区龙东大道3000号",
          "contact": "任正非",
          "contact-position": "CEO",
          "contact-otherinfo": "1101234567",
          "contact-telephone": "18678334918",
          "remarks": "测试更新这里是备注",
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
          "category": {
            "1": {
              "id": "120001",
              "name": "休闲娱乐"
            },
            "2": {
              "id": "120106",
              "name": "足疗按摩"
            },
            "3": {
              "id": "120112",
              "name": "修脚"
            }
          },
          "enterprise": null,
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
          "code": "abcdefg",
          "town-name": "沪东新村街道"
        }
      }
    }

    request:

    PUT /stores/:id

    {
      "data": {
        "type": "stores",
        "attributes": {
        "code": "abcdefg",
        "developer_id": 1,   // BD专员的id
        "enterprise_id": 1,   // 所属企业的id
        "operator_id":1,    // 运营专员的id
        "block_id": 1,    // 所属区块id
        "category": {
            "1": {"id": "120001", "name": "休闲娱乐"},
            "2": {"id": "120106", "name": "足疗按摩"},
            "3": {"id": "120112", "name": "修脚"}
         },
        "district": {
            "1": {"id": "110000", "name": "北京市"},
            "2": {"id": "110001", "name": "北京市"},
            "3": {"id": "110101", "name": "东城区"}
         },
        "name": "华为科技",
        "product": "男装",
        "address": "上海市浦东新区龙东大道3000号",
        "contact": "任正非",
        "contact_position": "CEO",    // 联系人职位
        "contact_otherinfo": "1101234567",
        "contact_telephone": "18678334918",
        "remarks": "测试更新这里是备注"
        }
      }
    }

    response:

    200 ok

    {
      "data": {
        "id": "1",
        "type": "stores",
        "attributes": {
          "name": "华为科技",
          "product": "男装",
          "operator": {
            "id": 1,
            "name": "admin"
          },
          "developer": {
            "id": 1,
            "name": "admin"
          },
          "block": {
            "id": 1,
            "name": "川沙"
          },
          "address": "上海市浦东新区龙东大道3000号",
          "contact": "任正非",
          "contact-position": "CEO",
          "contact-otherinfo": "1101234567",
          "contact-telephone": "18678334918",
          "remarks": "测试更新这里是备注",
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
          "category": {
            "1": {
              "id": "120001",
              "name": "休闲娱乐"
            },
            "2": {
              "id": "120106",
              "name": "足疗按摩"
            },
            "3": {
              "id": "120112",
              "name": "修脚"
            }
          },
          "enterprise": null,
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
          "code": "abcdefg"
        }
      }
    }

## 删除商铺信息

    request:

    DELETE /stores/:id

    response:

    204 no_content
