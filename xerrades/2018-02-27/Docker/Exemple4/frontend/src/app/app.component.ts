import { ColorService } from './services/color-service.service';
import { Component, OnInit } from '@angular/core';
import { Color } from './model/color';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  maxId: number;
  error = '';
  llistaColors: Color[] = [];

  constructor(private servei: ColorService) {
    this.servei.getMaxId().subscribe(
      data => {
        this.maxId = data.message;
        console.log(this.maxId);
      },
      err => {
        this.error = err.message;
      }
    );
  }

  ngOnInit(): void {
    this.onReload();
  }

  onReload() {
    let nousColors: Color[] = [];
    for (let i = 0; i < 10; i++) {
      const numColor = this.getRandomInt(1, this.maxId);
      this.servei.getColor(numColor).subscribe(
        data => {
          console.log(data);
          const nouColor = data;
          nousColors.push(nouColor);
        },
        err => {
          console.log(err);
          this.error = err.message;
        }
      );
    }
    this.llistaColors = nousColors;
    console.log(this.llistaColors);
  }

  getRandomInt(min: number = 1, max: number = 1): number {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }
}
