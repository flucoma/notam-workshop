(
~distributions = {
	arg ds, steps = 100;
	ds.dump({
		arg dict;
		var data = dict["data"].values.flop;
		var histograms = data.collect{arg dim; dim.histo(steps)};
		fork({
			var win = Window("Distributions",Rect(0,0,800,820));
			var plotter = Plotter("Distributions",Rect(0,20,win.bounds.width,win.bounds.height-20),win);
			EZSlider(win,Rect(0,0,win.bounds.width,20),"Dimension:",ControlSpec(0,histograms.size-1,step:1),{
				arg sl;
				plotter.value_(histograms[sl.value.asInteger]);
			},0,true,80);
			win.front;
		},AppClock);
	});
};
~distributions.(~ds,20);
)