import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, AbstractControl, FormBuilder, Validators } from '@angular/forms';
import { HttpService } from '../services/http/http.service';
import { Router, NavigationExtras } from '@angular/router';
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
      let body = {
        username: this.login.username,
        password: this.login.password,
      }

      this.http.postPromise('login', body, this.http.postHeaderEmpty('application/json')).then(
        (res: any) => {
          console.log(res);
          if (res.length > 0) {
            const navigationExtras: NavigationExtras = {
              state: {
                res
            };
            this.router.navigate(['/home', navigationExtras]);
          } else {
            alert("Usuario o password incorrecta");
          }
        },
        err => {

        }
      )
    } else {
      for (let field in this.loginForm.controls) { // 'field' is a string
        let control: any = this.loginForm.get(field); // 'control' is a FormControl
        if (control.valid === false) {
          control.touched = true;
        }
      }
      alert("Campos Incorrectos");
    }
  }
}
