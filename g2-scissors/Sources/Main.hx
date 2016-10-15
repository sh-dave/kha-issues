class Main {
	public static function main() kha.System.init({ width: 1024, height: 768}, kha.Assets.loadEverything.bind(setup));

	static var bb : kha.Image;

	static function setup() {
		bb = kha.Image.createRenderTarget(1024, 768, kha.graphics4.TextureFormat.RGBA32, kha.graphics4.DepthStencilFormat.DepthAutoStencilAuto);
		kha.System.notifyOnRender(renderFB);
		// kha.System.notifyOnRender(renderBB);	
	}

	static function renderBB( framebuffer : kha.Framebuffer ) {
		doStuff(bb.g2);

		framebuffer.g2.begin(true, kha.Color.Black);
			kha.Scaler.scale(bb, framebuffer, kha.System.screenRotation);
		framebuffer.g2.end();
	}

	static function renderFB( framebuffer : kha.Framebuffer ) doStuff(framebuffer.g2);

	static function doStuff( g2 : kha.graphics2.Graphics ) {
		g2.begin(true, kha.Color.Black);
		g2.end();

		g2.begin(false);
			g2.color = kha.Color.Red;
			g2.scissor(8, 8, Std.int(1024 / 2) - 16, Std.int(768 / 2) - 16);
			g2.fillRect(0, 0, 1024, 768);
			g2.disableScissor();
		// g2.end();

		// g2.begin(false);
			g2.color = kha.Color.Green;
			g2.scissor(Std.int(1024 / 2 + 8), 8, Std.int(1024 / 2) - 16, Std.int(768 / 2) - 16);
			g2.fillRect(0, 0, 1024, 768);
			g2.disableScissor();			
		// g2.end();

		// g2.begin(false);
			g2.color = kha.Color.Blue;
			g2.scissor(8, Std.int(768 / 2) + 8, 1024 - 16, Std.int(768 / 2) - 16);
			g2.fillRect(0, 0, 1024, 768);
			g2.disableScissor();

			g2.color = kha.Color.White;
			g2.drawScaledImage(kha.Assets.images.ss, 1024 * 0.25, 768 * 0.25, 1024 * 0.5, 768 * 0.5);
		g2.end();		
	}
}
