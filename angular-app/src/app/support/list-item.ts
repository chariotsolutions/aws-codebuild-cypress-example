import { ItemType } from './item-type.enum';

export interface ListItem {
    purchased?: boolean;
    name: String;
    category: ItemType
}
