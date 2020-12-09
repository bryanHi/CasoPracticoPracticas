import { Component, OnInit } from '@angular/core';
import { HttpService } from '../services/http/http.service'
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(
    public http: HttpService,
  ) { }

  ngOnInit(): void {
  }

}
