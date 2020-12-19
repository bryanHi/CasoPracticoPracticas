import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ObtenerClientesComponent } from './obtener-clientes.component';

describe('ObtenerClientesComponent', () => {
  let component: ObtenerClientesComponent;
  let fixture: ComponentFixture<ObtenerClientesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ObtenerClientesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ObtenerClientesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
