global.shopLibrary =
{
	shop_burger:
	{
		name: "Burger",
		description: "The typical, beautiful american lunch!\nHeals 10 HP",
		icon: spr_test_burger,
		inv: SHOP_WHICH_INV.ITEM,
		cost: 10
	},
	shop_mana_burg:
	{
		name: "Mana Burger",
		description: "Restores 50 mana",
		icon: spr_test_burger_1,
		inv: SHOP_WHICH_INV.ITEM,
		cost: 30
	},
	shop_cola:
	{
		name: "Coca Cola",
		description: "'Heals' 10 HP",
		icon: spr_test_burger,
		inv: SHOP_WHICH_INV.ITEM,
		cost: 1
	},
}

enum SHOP_WHICH_INV {
	ITEM = 0,
	WEAPON = 1,
	ARMOR = 2,
	KEY = 3
}

//function scr_shop_push_item(_list, _item) {
//	array_push(_list, _item);
//}

function scr_shop_buy_item(_inv ,_item) {
	global.party_money -= _item.cost;
	switch (_item) {
		case global.shopLibrary.shop_burger:
			array_push(_inv, global.item_list.burger);
			for (var i = 0; i < array_length(global.party); ++i) {
				array_push(global.party[i].actions, global.actionItemsLibrary.items_burger);
			}
			break;
		case global.shopLibrary.shop_cola:
			array_push(_inv, global.item_list.cola_espona);
			for (var i = 0; i < array_length(global.party); ++i) {
				array_push(global.party[i].actions, global.actionItemsLibrary.items_cocacola);
			}
			break;
		case global.shopLibrary.shop_mana_burg:
			array_push(_inv, global.item_list.mana_burg);
			for (var i = 0; i < array_length(global.party); ++i) {
				array_push(global.party[i].actions, global.actionItemsLibrary.items_manaburg);
			}
			break;
	}
}