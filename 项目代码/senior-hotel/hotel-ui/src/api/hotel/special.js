import request from '@/utils/request'

// 查询酒店特色列表
export function listSpecial(query) {
  return request({
    url: '/hotel/special/list',
    method: 'get',
    params: query
  })
}

// 查询酒店特色详细
export function getSpecial(specialId) {
  return request({
    url: '/hotel/special/' + specialId,
    method: 'get'
  })
}

// 新增酒店特色
export function addSpecial(data) {
  return request({
    url: '/hotel/special',
    method: 'post',
    data: data
  })
}

// 修改酒店特色
export function updateSpecial(data) {
  return request({
    url: '/hotel/special',
    method: 'put',
    data: data
  })
}

// 删除酒店特色
export function delSpecial(specialId) {
  return request({
    url: '/hotel/special/' + specialId,
    method: 'delete'
  })
}
