import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, AbstractControl, FormBuilder, Validators } from '@angular/forms';
import { HttpService } from '../services/http/http.service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  username: any;
  name: any;
  password: any;
  loginForm: any;
  login: any;

  constructor(
    public http: HttpService,
    private router: Router,
    private formBuilder: FormBuilder
  ) {
    this.login = { username: '', password: '' }
  }

  ngOnInit(): void {
    this.loginForm = new FormGroup({
      username: new FormControl({ value: '' }, Validators.compose([Validators.required, Validators.email])),
      password: new FormControl({ value: '' }, Validators.compose([Validators.required])),
    });
  }

  on_login() {

    if (this.loginForm.valid) {
      // let body = {
      //   username: this.username,
      //   password: this.password,
      // }
      //
      // this.http.postPromise('login', body, this.http.postHeaderEmpty('application/json')).then(
      //   (res: any) => {
      //     console.log(res);
      //     if (res.length > 0) {
      //       this.router.navigate(['/home']);
      //     } else {
      //       alert("Usuario o clave incorrecta");
      //     }
      //   },
      //   err => {
      //
      //   }
      // )
    } else {
      alert("Campos Incorrectos");
    }
  }
}
