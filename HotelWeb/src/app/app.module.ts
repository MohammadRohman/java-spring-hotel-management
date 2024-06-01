import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { RouterModule, Routes } from '@angular/router';

import { NzLayoutModule } from 'ng-zorro-antd/layout';

import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component'; // Assuming you have a HomeComponent for routing

const routes: Routes = [
  { path: '', component: HomeComponent }
];

@NgModule({
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    NzLayoutModule,
    RouterModule.forRoot(routes),
    AppComponent
  ],
  providers: [],
  
})
export class AppModule { }
