import request from '@/utils/request'

// 查询酒店服务列表
export function listService(query) {
  return request({
    url: '/hotel/service/list',
    method: 'get',
    params: query
  })
}

// 查询酒店服务详细
export function getService(serviceId) {
  return request({
    url: '/hotel/service/' + serviceId,
    method: 'get'
  })
}

// 新增酒店服务
export function addService(data) {
  return request({
    url: '/hotel/service',
    method: 'post',
    data: data
  })
}

// 修改酒店服务
export function updateService(data) {
  return request({
    url: '/hotel/service',
    method: 'put',
    data: data
  })
}

// 删除酒店服务
export function delService(serviceId) {
  return request({
    url: '/hotel/service/' + serviceId,
    method: 'delete'
  })
}
