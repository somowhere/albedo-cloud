import request from '@/utils/request'
import qs from 'qs'


export function page(params) {
  return request({
    url: '/test/test-book/?' + qs.stringify(params, { indices: false }),
    method: 'get'
  })
}

export function save(data) {
  return request({
    url: '/test/test-book',
    method: 'post',
    data
  })
}

export function del(ids) {
  return request({
    url: '/test/test-book',
    method: 'delete',
    data: ids
  })
}


export function get(id) {
  return request({
    url: '/test/test-book/' + id,
    method: 'get'
  })
}

export default { page, del, save, get }