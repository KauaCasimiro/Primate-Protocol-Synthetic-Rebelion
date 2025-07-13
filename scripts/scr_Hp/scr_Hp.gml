// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Hp(_hp_Max) constructor{
	hp_Max = _hp_Max
	
	hp = hp_Max
	
	hp_Temp = hp;
	
	hp_Bg = hp;
	
	// Metodo para perder vida
	
	static lose_Hp = function(_qtd = 1) {
		hp -= _qtd;
		hp = clamp(hp, 0, hp_Max);
		return hp;
	}
	
	// Desenha a barra de vida do player
	static draw_Hp = function(_x, _y, _width, _height) {
		
		//largura da de acordo com a vida atual
		var w_Hp = (hp_Temp/hp_Max) * _width;
		var w_Hp_Bg = (hp_Bg/hp_Max) * _width 
		
		var _color = merge_color(c_red, c_lime, hp_Temp/hp_Max);
		
		// Diminuir o valor atual de vida
		hp_Temp = lerp(hp_Temp, hp, 0.1);
		hp_Bg = lerp(hp_Bg, hp_Temp, 0.03);
		
		// fundo da barra de vida
		draw_rectangle_color(_x - 2, _y - 2, _x + _width + 2, _y + _height + 2, c_navy,c_navy,c_navy,c_navy, false);
		
		// Efeito de perder vida
		draw_rectangle_color(_x, _y, _x + w_Hp_Bg, _y + _height, c_red, c_red, c_red, c_red, false);
		
		//Barra de vida
		draw_rectangle_color(_x, _y, _x + w_Hp, _y + _height, _color, _color, _color, _color,  false);
	}
}