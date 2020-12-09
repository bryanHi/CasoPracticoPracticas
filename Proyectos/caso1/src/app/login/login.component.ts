import { Component, OnInit } from '@angular/core';
import { HttpService } from '../services/http/http.service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  correo: any;
  clave: any;

  constructor(
    public http: HttpService,
    private router: Router
  ) { }

  ngOnInit(): void {
  }

  login() {
    let body = {
      correo: this.correo,
      clave: this.clave,
    }

    this.http.postPromise('login', body, this.http.postHeaderEmpty('application/json')).then(
      (res: any) => {
        console.log(res);
        if (res.length > 0) {
          this.router.navigate(['/home']);
        } else {
          alert("Usuario o clave incorrecta");
        }
      },
      err => {

      }
    )
  }

  test() {
    this.http.getPromise('test', '').then(
      res => {
        console.log(res);

      },
      err => {

      }
    );
  }


}
