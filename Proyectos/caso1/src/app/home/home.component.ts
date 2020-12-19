import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  // @Input()
  // user = [];

  user: any;

  constructor(private route: ActivatedRoute,
    private router: Router) {
    const navigation = this.router.getCurrentNavigation();
    const state = navigation.extras.state as {
      transId: string,
      workQueue: boolean,
      services: number,
      code: string
    };
    this.test = "Transaction Key:" + state.transId + "<br /> Configured:" + state.workQueue + "<br /> Services:" + state.services + "<br /> Code: " + state.code;

    this.user = this.route.snapshot.paramMap.get('user');
    console.log(this.user[0].ID_PERFILES);


  }

  ngOnInit(): void {
  }

}
