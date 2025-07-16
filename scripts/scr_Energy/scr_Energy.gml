// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Energy(_energy_Max) constructor{
	energy_Max = _energy_Max
	
	energy = energy_Max
	
	energy_Temp = energy;
	
	energy_Bg = energy;
	
	// Metodo para perder energia
	
	static lose_Energy = function(_qtd = 1) {
		energy -= _qtd;
		energy = clamp(energy, 0, energy_Max);
		return energy;
	}
	
	static gain_Energy = function(_qtd = 1) {
		energy += _qtd;
		energy = clamp(energy, 0, energy_Max);
		return energy;
	}
	
	// Desenha a barra de energia do player
	static draw_Energy = function(_x, _y, _width, _height) {
		
		//largura da de acordo com a energia atual
		var w_energy = (energy_Temp/energy_Max) * _width;
		var w_energy_Bg = (energy_Bg/energy_Max) * _width 
		
		var _color = merge_color(c_red, c_blue, energy_Temp/energy_Max);
		
		// Diminuir o valor atual de energia
		energy_Temp = lerp(energy_Temp, energy, 0.1);
		energy_Bg = lerp(energy_Bg, energy_Temp, 0.03);
		
		// fundo da barra de energia
		draw_rectangle_color(_x - 2, _y - 2, _x + _width + 2, _y + _height + 2, c_navy,c_navy,c_navy,c_navy, false);
		
		// Efeito de perder energia
		draw_rectangle_color(_x, _y, _x + w_energy_Bg, _y + _height, c_aqua, c_aqua, c_aqua, c_aqua, false);
		
		//Barra de energia
		draw_rectangle_color(_x, _y, _x + w_energy, _y + _height, _color, _color, _color, _color,  false);
	}
}