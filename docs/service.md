# service 服务

## 返回所有服务

    request:

    get /services?page[number]=1

    response:

    200 ok

    {
      "data": [
        {
          "id": "14",
          "type": "services",
          "attributes": {
            "name": "维浦",
            "company-name": "维浦科技",
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
            "contact": "Harry",
            "contact-position": "CEO",
            "contact-telephone": "18678334918",
            "contact-otherinfo": "1101234567",
            "remarks": "测试更新这里是备注"
          }
        },
        {
          "id": "13",
          "type": "services",
          "attributes": {
            "name": "银联",
            "company-name": "维浦科技",
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
            "contact": "Harry",
            "contact-position": "CEO",
            "contact-telephone": "18678334918",
            "contact-otherinfo": "1101234567",
            "remarks": "测试更新这里是备注"
          }
        }
      ],
      "links": {
        "self": "http://192.168.0.23:3000/services?page%5Bnumber%5D=1&page%5Bsize%5D=2",
        "next": "http://192.168.0.23:3000/services?page%5Bnumber%5D=2&page%5Bsize%5D=2",
        "last": "http://192.168.0.23:3000/services?page%5Bnumber%5D=3&page%5Bsize%5D=2"
      },
      "meta": {
        "total-count": 5
      }
    }

## 返回一个商铺所使用的所有服务

    登录 +

    request:

    get /stores/:id/services?page[number]=1

    response:

    {
      "data": [
        {
          "id": "10",
          "type": "services",
          "attributes": {
            "name": "POS",
            "company-name": "维浦科技",
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
            "contact": "Harry",
            "contact-position": "CEO",
            "contact-telephone": "18678334918",
            "contact-otherinfo": "1101234567",
            "remarks": "测试更新这里是备注"
          }
        },
        {
          "id": "11",
          "type": "services",
          "attributes": {
            "name": "微信",
            "company-name": "维浦科技",
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
            "contact": "Harry",
            "contact-position": "CEO",
            "contact-telephone": "18678334918",
            "contact-otherinfo": "1101234567",
            "remarks": "测试更新这里是备注"
          }
        }
      ],
      "links": {
        "self": "http://192.168.0.23:3000/stores/1/services?page%5Bnumber%5D=1&page%5Bsize%5D=2",
        "next": "http://192.168.0.23:3000/stores/1/services?page%5Bnumber%5D=2&page%5Bsize%5D=2",
        "last": "http://192.168.0.23:3000/stores/1/services?page%5Bnumber%5D=3&page%5Bsize%5D=2"
      },
      "meta": {
        "total-count": 5
      }
    }

## 添加服务

    登录 +, 角色：super_admin

    request:

    post /services

    {
      "data": {
        "type": "services",
        "attributes": {
        "name": "POS",
        "company_name": "维浦科技",
        "district": {
            "1": {"id": "110000", "name": "北京市"},
            "2": {"id": "110001", "name": "北京市"},
            "3": {"id": "110101", "name": "东城区"}
         },
        "address": "上海市浦东新区龙东大道3000号",
        "contact_telephone": "18678334918",
        "contact": "Harry",
        "contact_position": "CEO",
        "contact_otherinfo": "1101234567",
        "remarks": "测试更新这里是备注"
        }
      }
    }

    response:

    201 created, 422 unprocessable_entity

    {
      "data": {
        "id": "9",
        "type": "services",
        "attributes": {
          "name": "POS",
          "company-name": "维浦科技",
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
          "contact": "Harry",
          "contact-position": "CEO",
          "contact-telephone": "18678334918",
          "contact-otherinfo": "1101234567",
          "remarks": "测试更新这里是备注"
        }
      }
    }

## 编辑

    登录 +， 角色： super_admin

    request:

    get /services/:id/edit

    response:

    {
      "data": {
        "id": "14",
        "type": "services",
        "attributes": {
          "name": "维浦",
          "company-name": "维浦科技",
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
          "contact": "Harry",
          "contact-position": "CEO",
          "contact-telephone": "18678334918",
          "contact-otherinfo": "1101234567",
          "remarks": "测试更新这里是备注"
        }
      }
    }

    request:

    put /services/:id

    {
      "data": {
        "type": "services",
        "attributes": {
        "name": "维浦",
        "company_name": "维浦科技",
        "district": {
            "1": {"id": "110000", "name": "北京市"},
            "2": {"id": "110001", "name": "北京市"},
            "3": {"id": "110101", "name": "东城区"}
         },
        "address": "上海市浦东新区龙东大道3000号",
        "contact_telephone": "18678334918",
        "contact": "Harry",
        "contact_position": "CEO",
        "contact_otherinfo": "1101234567",
        "remarks": "测试更新这里是备注"
        }
      }
    }

    response:

    200 ok, 422 unprocessable_entity

    {
      "data": {
        "id": "14",
        "type": "services",
        "attributes": {
          "name": "维浦",
          "company-name": "维浦科技",
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
          "contact": "Harry",
          "contact-position": "CEO",
          "contact-telephone": "18678334918",
          "contact-otherinfo": "1101234567",
          "remarks": "测试更新这里是备注"
        }
      }
    }

## 删除

  登录 +， 角色： super_admin

  request:

  DELETE /services/:id

  response:

  204 no_content, 422 unprocessable_entity, 如果有其他商铺正在使用这项服务，会返回422状态码和错误信息
