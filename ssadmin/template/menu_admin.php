<ul class="nav nav-list">
					<li class="<?php if($_GET['p']=="") echo "active"?>">
						<a href="?">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> Beranda </span>
						</a>
						<b class="arrow"></b>
					</li>

					<li class="<?php if($_GET['p']=="master") echo "active"?>">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
								Master
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="<?php if($_GET['halaman']=="jabatan") echo "active"?>">
								<a href="?p=master&halaman=jabatan">
									<i class="menu-icon fa fa-caret-right"></i>
									Data Jabatan
								</a>
								<b class="arrow"></b>
							</li>
							<li class="<?php if($_GET['halaman']=="karyawan") echo "active"?>">
								<a href="?p=master&halaman=karyawan">
									<i class="menu-icon fa fa-caret-right"></i>
									Data Karyawan
								</a>
								<b class="arrow"></b>
							</li>
							<li class="<?php if($_GET['halaman']=="data_user") echo "active"?>">
								<a href="?p=master&halaman=data_user">
									<i class="menu-icon fa fa-caret-right"></i>
									Data User
								</a>
								<b class="arrow"></b>
							</li>

						</ul>
					</li>

				</ul><!-- /.nav-list -->