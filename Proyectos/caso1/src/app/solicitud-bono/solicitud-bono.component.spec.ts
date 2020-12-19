import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SolicitudBonoComponent } from './solicitud-bono.component';

describe('SolicitudBonoComponent', () => {
  let component: SolicitudBonoComponent;
  let fixture: ComponentFixture<SolicitudBonoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SolicitudBonoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SolicitudBonoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
