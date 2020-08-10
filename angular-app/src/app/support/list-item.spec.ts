import { ListItem } from './list-item';
import { ItemType } from './item-type.enum';

describe('ListItem', () => {
  it('should create an instance', () => {
    expect({done: false, name: 'eggs', type: ItemType.FOOD}).toBeTruthy();
  });
});
