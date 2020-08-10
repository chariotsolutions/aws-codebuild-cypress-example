import { Component, OnInit } from '@angular/core';
import { ListItem } from '../support/list-item';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ItemType } from '../support/item-type.enum';

@Component({
  selector: 'app-shopping-list',
  templateUrl: './shopping-list.component.html',
  styleUrls: ['./shopping-list.component.scss']
})
export class ShoppingListComponent implements OnInit {
  shoppingList: Array<ListItem> = [];
  shoppingItemForm: FormGroup;
   itemTypes = [ItemType.BAKERY, ItemType.DRINK, ItemType.FOOD, ItemType.PHARMACY,
                ItemType.SALAD_BAR, ItemType.SNACKS, ItemType.TOILETRIES];
  constructor(private builder: FormBuilder) { }

  ngOnInit(): void {
     this.shoppingItemForm = this.builder.group({
       'purchased': [false, [], []],
       'name': ['', [], []],
       'category': ['', [], []]
     }, []);
  }

  addItem() {
    const formData = this.shoppingItemForm.value as ListItem;
    this.shoppingList.push(formData);
    this.shoppingItemForm.reset({purchased: false});
  }
}
