/* radare - LGPL - Copyright 2009-2010 pancake<@nopcode.org> */

[Compact]
[CCode (cheader_filename="r_reg.h,r_list.h,r_types_base.h", cname="RReg", free_function="r_reg_free", cprefix="r_reg_")]
public class Radare.RReg {
	[CCode (cprefix="R_REG_TYPE_", cname="int")]
	public enum Type {
		GPR,
		DRX,
		FPU,
		MMX,
		XMM,
		FLG,
		SEG,
		LAST,
		ALL
	}

	[Compact]
	[CCode (cname="RRegItem", destroy_function="", free_function="" )]
	public class Item {
		public string name;
		public int size;
		public int offset;
		public int packed_size;
		public RReg.Type type;
	}

	[Compact]
	[CCode (cname="RRegArena", destroy_function="", free_function="" )]
	public class Arena {
		public uint8* bytes;
		public int size;
	}
	
	[Compact]
	[CCode (cname="RRegSet", destroy_function="", free_function="" )]
	public class Set {
		public RReg.Arena arena;
		//public RList<RReg.Arena*> arenas;
		public RList<RReg.Item*> regs;
	}

	public RReg();
	public bool set_profile(string file);
	public bool set_profile_string(string profile);
	public Item @get(string name, int type = -1);
	/* TODO: use r_flist or r_list here */
	//public KernelList<RReg.Item*> get_list(RReg.Type type);

	public bool set_name(int role, string name);
	public unowned string get_name(int role);
	public static int get_name_idx(string type);
	public static int type_by_name(string str);

	public static unowned string? get_type(int idx);

	public uint64 get_value(Item item);
	public bool set_value(Item item, uint64 val);

	public float get_float(Item item);
	public bool set_float(Item item, float val);

	public double get_double(Item item);
	public bool set_double (Item item, double val);

	public bool set_pack(Item item, int pidx, int pbits, uint64 val);
	public uint64 get_pack(Item item, int pidx, int pbits);

	public uint8* get_bytes(Type type, out int size = null);
	public int set_bytes(Type type, uint8* buf, int len);

	public void fit_arena();
	public bool arena_push ();
	public void arena_pop();
	//public uint64 arena_cmp (RReg.Item item);
}
