import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { NzLayoutModule } from 'ng-zorro-antd/layout';
import { NgModule } from '@angular/core';

@Component({
  standalone : true,
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
  imports: [RouterOutlet,AppComponent,NzLayoutModule]
})
export class AppComponent {
  title = 'HotelWeb';
}
