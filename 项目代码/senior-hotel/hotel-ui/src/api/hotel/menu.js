import request from '@/utils/request'

// 查询酒店菜单列表
export function listMenu(query) {
  return request({
    url: '/hotel/menu/list',
    method: 'get',
    params: query
  })
}

// 查询酒店菜单详细
export function getMenu(menuId) {
  return request({
    url: '/hotel/menu/' + menuId,
    method: 'get'
  })
}

// 新增酒店菜单
export function addMenu(data) {
  return request({
    url: '/hotel/menu',
    method: 'post',
    data: data
  })
}

// 修改酒店菜单
export function updateMenu(data) {
  return request({
    url: '/hotel/menu',
    method: 'put',
    data: data
  })
}

// 删除酒店菜单
export function delMenu(menuId) {
  return request({
    url: '/hotel/menu/' + menuId,
    method: 'delete'
  })
}
