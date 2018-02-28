import { Color } from './../model/color';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class ColorService {
  URL = 'http://colorsservice:4567/';

  constructor(private http: HttpClient) {}

  getColor(numero: number) {
    return this.http.get<Color>(this.URL + 'numero/' + numero);
  }

  getMaxId() {
    return this.http.get<any>(this.URL + 'maxid');
  }
}
