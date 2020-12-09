import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class HttpService {

  path: string = 'http://localhost:8080/';

  constructor(public http: HttpClient) {
    console.log('Hello HttpService');
  }

  getHeader(token:any) {
    let options = {
      headers: {
        'Authorization': 'Token ' + token
      }
    };
    return options;
  }

  getPromise(url:any, options:any) {

    return this.http
      .get(this.path + url, options).toPromise();
  }

  postHeaderEmpty(content:any) {
    let options = {
      headers: {
        'Content-Type': content
      }
    };
    return options;
  }

  postPromise(url:any, body:any, options:any) {
    return this.http
      .post(this.path + url, body, options).toPromise();
  }

}
