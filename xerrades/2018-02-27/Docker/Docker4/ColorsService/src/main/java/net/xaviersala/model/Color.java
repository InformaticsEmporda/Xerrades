package net.xaviersala.model;

public class Color {
	int id;
	String nom;
	String rgb;

	public Color() {
		id = -1;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getRgb() {
		return rgb;
	}
	public void setRgb(String rgb) {
		this.rgb = rgb;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Color [");
		builder.append(id);
		builder.append(", ");
		builder.append(nom);
		builder.append(", ");
		builder.append(rgb);
		builder.append("]");
		return builder.toString();
	}
	
	
}
