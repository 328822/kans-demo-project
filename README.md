Step 1: 

Please make sure you have latest version of below softwares are installed

1. terrraform
2. python
3. aws cli

Step 2:

Run "aws configure" command to configure the access key, secret and the default region 
You should be able to locate your aws credentials under file `~/.aws/credentials` and the default region under `~/.aws/config`

Step 3:

Generate the keypair using command "ssh-keygen" and get the file names as kp_devops which will generate two files kp_devops (key) and kp_devops.pub (public key)

Step 4: 

Update the kp_devops.pub path in file terraform/vars.tf (public_key_path) 
Update the kp_devops path in file ansible/group_vars/all (ansible_ssh_private_key_file)

Step 5:

Run below commands 

terraform init
terraform plan

if you are fine with the plan then continue to do with the 

terraform apply

Sample terraform plan

```
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.aws_ami.centos: Refreshing state...

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_eip.static_public_ip will be created
  + resource "aws_eip" "static_public_ip" {
      + allocation_id     = (known after apply)
      + association_id    = (known after apply)
      + domain            = (known after apply)
      + id                = (known after apply)
      + instance          = (known after apply)
      + network_interface = (known after apply)
      + private_dns       = (known after apply)
      + private_ip        = (known after apply)
      + public_dns        = (known after apply)
      + public_ip         = (known after apply)
      + public_ipv4_pool  = (known after apply)
      + vpc               = true
    }

  # aws_instance.ec2_devops will be created
  + resource "aws_instance" "ec2_devops" {
      + ami                          = "ami-0b4dd9d65556cac22"
      + arn                          = (known after apply)
      + associate_public_ip_address  = true
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = "kp_devops"
      + network_interface_id         = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tags                         = {
          + "Name" = "ec2_devops"
        }
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_internet_gateway.igw_devops will be created
  + resource "aws_internet_gateway" "igw_devops" {
      + id       = (known after apply)
      + owner_id = (known after apply)
      + vpc_id   = (known after apply)
    }

  # aws_key_pair.kp_devops will be created
  + resource "aws_key_pair" "kp_devops" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + key_name    = "kp_devops"
      + public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDiu/dd8y7dTos1hllAtRVZj99rKqsuRMo9mbVdNNzFvQzB9itDVvyS/vtLaeYDzmrVL+MP6FrxplGU1pER+zjciOTBn004H5FEZlmrdHrsjvHvXf8//yOy/NTdCrzy65C27j4KgJrDG0BjEzDgoSnZ6OWsOK6BJTC8DJBTDj/yLz+r0Jzm2M0A10tUopiKqqYmG7j+uPjcbmzxm2EqHBD2BaO5v6MCAqa8Jjsbx22tj7DCjjsLzqZFVox2yZ5POTrizXjzpyjXxNBj2u6ChBP7VbSso+wFmm+oQwjk+6SH3GTeur+QOHB0k4dzmQHTk22oYijgTYTwOHMKvGrshQZr sl@MacBook-Pro-2.local"
    }

  # aws_main_route_table_association.igw_route_table_assoc will be created
  + resource "aws_main_route_table_association" "igw_route_table_assoc" {
      + id                      = (known after apply)
      + original_route_table_id = (known after apply)
      + route_table_id          = (known after apply)
      + vpc_id                  = (known after apply)
    }

  # aws_route_table.route_table will be created
  + resource "aws_route_table" "route_table" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + vpc_id           = (known after apply)
    }

  # aws_security_group.sg_devops will be created
  + resource "aws_security_group" "sg_devops" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "sg_devops"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "sg_devops"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.sub_public_devops will be created
  + resource "aws_subnet" "sub_public_devops" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = (known after apply)
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.1.0/20"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name" = "sub_public_devops"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.vpc_devops will be created
  + resource "aws_vpc" "vpc_devops" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.0.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = (known after apply)
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Name" = "vpc_devops"
        }
    }

Plan: 9 to add, 0 to change, 0 to destroy.
```

Step 6:

Run the ansible playbook using the command (please make sure ec2.py is in executable state)

ansible-playbook -i ec2.py -l tag_Name_ec2_devops provision.yml

sample output looks like

```
PLAY [all] ************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************
The authenticity of host '54.255.188.35 (54.255.188.35)' can't be established.
ECDSA key fingerprint is SHA256:9IfFVmutL66tEI40YXiejn5mX/DUx5bffQnQdLFjlyM.
Are you sure you want to continue connecting (yes/no)? yes
ok: [54.255.188.35]

TASK [java : install openjdk] *****************************************************************************************************************************************
changed: [54.255.188.35]

TASK [telnet : install telnet] ****************************************************************************************************************************************
changed: [54.255.188.35]

TASK [nslookup : install nslookup] ************************************************************************************************************************************
changed: [54.255.188.35]

TASK [curl : install curl] ********************************************************************************************************************************************
changed: [54.255.188.35]

TASK [apache : setup apache webserver] ********************************************************************************************************************************
changed: [54.255.188.35]

TASK [apache : start apache service] **********************************************************************************************************************************
changed: [54.255.188.35]

TASK [tomcat : setup tomcat server] ***********************************************************************************************************************************
changed: [54.255.188.35]

TASK [tomcat : start tomcat service] **********************************************************************************************************************************
changed: [54.255.188.35]

TASK [mysql : Install MySQL 5.7 repo] *********************************************************************************************************************************
changed: [54.255.188.35]

TASK [mysql : Install MySQL 5.7] **************************************************************************************************************************************
changed: [54.255.188.35] => (item=['mysql-community-server', 'mysql-community-client', 'MySQL-python'])

TASK [mysql : Start the MySQL service] ********************************************************************************************************************************
changed: [54.255.188.35]

TASK [mysql : Change mysql root password and keep track in] ***********************************************************************************************************
changed: [54.255.188.35]

TASK [mysql : restart mysqld] *****************************************************************************************************************************************
changed: [54.255.188.35]

PLAY RECAP ************************************************************************************************************************************************************
54.255.188.35              : ok=14   changed=13   unreachable=0    failed=0

```

Step 7:

Connect to the public IP mentioned using the below command

ssh -i <path_to_the_kp_devops_file> centos@<public_ip_from_output>

Step 7:

a) "nslookup www.google.com"; 

```
[centos@ip-10-0-10-47 ~]$ nslookup www.google.com
Server:		10.0.0.2
Address:	10.0.0.2#53

Non-authoritative answer:
Name:	www.google.com
Address: 74.125.24.147
Name:	www.google.com
Address: 74.125.24.99
Name:	www.google.com
Address: 74.125.24.103
Name:	www.google.com
Address: 74.125.24.104
Name:	www.google.com
Address: 74.125.24.105
Name:	www.google.com
Address: 74.125.24.106
Name:	www.google.com
Address: 2001:4860:4802:32::75
```

b) "curl https://www.google.com"; 

```
[centos@ip-10-0-10-47 ~]$ curl https://www.google.com
<!doctype html><html itemscope="" itemtype="http://schema.org/WebPage" lang="en-SG"><head><meta content="text/html; charset=UTF-8" http-equiv="Content-Type"><meta content="/images/branding/googleg/1x/googleg_standard_color_128dp.png" itemprop="image"><title>Google</title><script nonce="ZTBftgaDXqVkRsgkXfC+IQ==">(function(){window.google={kEI:'6c0iXuWjA9K6rQHDlb_wAw',kEXPI:'0,1353747,5662,730,224,4727,378,206,2955,249,10,51,1000,175,364,214,940,3,209,69,4,60,195,493,54,208,10,381,46,816,1128225,143,1197771,378,28,329090,1294,12383,4855,32692,15247,867,2237,26447,363,3320,5505,8384,4858,1362,4323,4967,3025,7863,7913,1808,1976,2044,8909,5297,2054,920,873,1217,2975,6430,7432,1571,1683,620,2884,20,318,1980,1192,1344,2778,520,399,1832,445,8,2796,1593,423,856,390,1822,202,328,149,1103,840,124,393,513,961,48,4258,260,52,1136,3,2063,606,1839,184,544,51,1182,143,377,257,429,1261,692,55,429,1053,93,328,1284,24,76,417,2426,2247,473,459,880,29,719,209,830,3227,773,1548,42,482,7,817,503,1574,3194,1545,6513,299,1945,588,472,427,981,1041,376,2083,217,784,225,1406,52,4,842,1308,1785,1274,108,1246,25,1002,653,481,405,503,2,433,507,715,147,1387,366,732,4,1661,326,338,730,2,557,3017,42,46,26,116,219,63,162,691,305,425,403,841,176,10,2,162,1912,523,200,30,156,625,189,21,183,88,279,39,111,144,496,8,69,624,192,785,24,61,875,707,78,705,734,403,629,86,96,373,440,1264,5854406,1805894,4194851,2801171,882,444,1,2,31,49,1,900,896,1,8,1,2,2551,1,748,141,59,736,563,1,4265,1,1,1,1,137,1,879,9,305,141,40,2,5,6,7,38,36,8,23964120',authuser:0,kGL:'SG',kBL:'H9fM'};google.sn='webhp';google.kHL='en-SG';google.jsfs='Ffpdje';})();(function(){google.lc=[];google.li=0;google.getEI=function(a){for(var b;a&&(!a.getAttribute||!(b=a.getAttribute("eid")));)a=a.parentNode;return b||google.kEI};google.getLEI=function(a){for(var b=null;a&&(!a.getAttribute||!(b=a.getAttribute("leid")));)a=a.parentNode;return b};google.ml=function(){return null};google.time=function(){return(new Date).getTime()};google.log=function(a,b,e,c,g){if(a=google.logUrl(a,b,e,c,g)){b=new Image;var d=google.lc,f=google.li;d[f]=b;b.onerror=b.onload=b.onabort=function(){delete d[f]};google.vel&&google.vel.lu&&google.vel.lu(a);b.src=a;google.li=f+1}};google.logUrl=function(a,b,e,c,g){var d="",f=google.ls||"";e||-1!=b.search("&ei=")||(d="&ei="+google.getEI(c),-1==b.search("&lei=")&&(c=google.getLEI(c))&&(d+="&lei="+c));c="";!e&&google.cshid&&-1==b.search("&cshid=")&&"slh"!=a&&(c="&cshid="+google.cshid);a=e||"/"+(g||"gen_204")+"?atyp=i&ct="+a+"&cad="+b+d+f+"&zx="+google.time()+c;/^http:/i.test(a)&&"https:"==window.location.protocol&&(google.ml(Error("a"),!1,{src:a,glmm:1}),a="");return a};}).call(this);(function(){google.y={};google.x=function(a,b){if(a)var c=a.id;else{do c=Math.random();while(google.y[c])}google.y[c]=[a,b];return!1};google.lm=[];google.plm=function(a){google.lm.push.apply(google.lm,a)};google.lq=[];google.load=function(a,b,c){google.lq.push([[a],b,c])};google.loadAll=function(a,b){google.lq.push([a,b])};}).call(this);google.f={};(function(){
document.documentElement.addEventListener("submit",function(b){var a;if(a=b.target){var c=a.getAttribute("data-submitfalse");a="1"==c||"q"==c&&!a.elements.q.value?!0:!1}else a=!1;a&&(b.preventDefault(),b.stopPropagation())},!0);}).call(this);
var a=window.location,b=a.href.indexOf("#");if(0<=b){var c=a.href.substring(b+1);/(^|&)q=/.test(c)&&-1==c.indexOf("#")&&a.replace("/search?"+c.replace(/(^|&)fp=[^&]*/g,"")+"&cad=h")};</script><style>#gbar,#guser{font-size:13px;padding-top:1px !important;}#gbar{height:22px}#guser{padding-bottom:7px !important;text-align:right}.gbh,.gbd{border-top:1px solid #c9d7f1;font-size:1px}.gbh{height:0;position:absolute;top:24px;width:100%}@media all{.gb1{height:22px;margin-right:.5em;vertical-align:top}#gbar{float:left}}a.gb1,a.gb4{text-decoration:underline !important}a.gb1,a.gb4{color:#00c !important}.gbi .gb4{color:#dd8e27 !important}.gbf .gb4{color:#900 !important}
</style><style>body,td,a,p,.h{font-family:arial,sans-serif}body{margin:0;overflow-y:scroll}#gog{padding:3px 8px 0}td{line-height:.8em}.gac_m td{line-height:17px}form{margin-bottom:20px}.h{color:#36c}.q{color:#00c}.ts td{padding:0}.ts{border-collapse:collapse}em{font-weight:bold;font-style:normal}.lst{height:25px;width:496px}.gsfi,.lst{font:18px arial,sans-serif}.gsfs{font:17px arial,sans-serif}.ds{display:inline-box;display:inline-block;margin:3px 0 4px;margin-left:4px}input{font-family:inherit}a.gb1,a.gb2,a.gb3,a.gb4{color:#11c !important}body{background:#fff;color:black}a{color:#11c;text-decoration:none}a:hover,a:active{text-decoration:underline}.fl a{color:#36c}a:visited{color:#551a8b}a.gb1,a.gb4{text-decoration:underline}a.gb3:hover{text-decoration:none}#ghead a.gb2:hover{color:#fff !important}.sblc{padding-top:5px}.sblc a{display:block;margin:2px 0;margin-left:13px;font-size:11px}.lsbb{background:#eee;border:solid 1px;border-color:#ccc #999 #999 #ccc;height:30px}.lsbb{display:block}.ftl,#fll a{display:inline-block;margin:0 12px}.lsb{background:url(/images/nav_logo229.png) 0 -261px repeat-x;border:none;color:#000;cursor:pointer;height:30px;margin:0;outline:0;font:15px arial,sans-serif;vertical-align:top}.lsb:active{background:#ccc}.lst:focus{outline:none}</style><script nonce="ZTBftgaDXqVkRsgkXfC+IQ=="></script></head><body bgcolor="#fff"><script nonce="ZTBftgaDXqVkRsgkXfC+IQ==">(function(){var src='/images/nav_logo229.png';var iesg=false;document.body.onload = function(){window.n && window.n();if (document.images){new Image().src=src;}
if (!iesg){document.f&&document.f.q.focus();document.gbqf&&document.gbqf.q.focus();}
}
})();</script><div id="mngb"> <div id=gbar><nobr><b class=gb1>Search</b> <a class=gb1 href="https://www.google.com.sg/imghp?hl=en&tab=wi">Images</a> <a class=gb1 href="https://maps.google.com.sg/maps?hl=en&tab=wl">Maps</a> <a class=gb1 href="https://play.google.com/?hl=en&tab=w8">Play</a> <a class=gb1 href="https://www.youtube.com/?gl=SG&tab=w1">YouTube</a> <a class=gb1 href="https://news.google.com.sg/nwshp?hl=en&tab=wn">News</a> <a class=gb1 href="https://mail.google.com/mail/?tab=wm">Gmail</a> <a class=gb1 href="https://drive.google.com/?tab=wo">Drive</a> <a class=gb1 style="text-decoration:none" href="https://www.google.com.sg/intl/en/about/products?tab=wh"><u>More</u> &raquo;</a></nobr></div><div id=guser width=100%><nobr><span id=gbn class=gbi></span><span id=gbf class=gbf></span><span id=gbe></span><a href="http://www.google.com.sg/history/optout?hl=en" class=gb4>Web History</a> | <a  href="/preferences?hl=en" class=gb4>Settings</a> | <a target=_top id=gb_70 href="https://accounts.google.com/ServiceLogin?hl=en&passive=true&continue=https://www.google.com/" class=gb4>Sign in</a></nobr></div><div class=gbh style=left:0></div><div class=gbh style=right:0></div> </div><center><br clear="all" id="lgpd"><div id="lga"><img alt="Google" height="92" src="/images/branding/googlelogo/1x/googlelogo_white_background_color_272x92dp.png" style="padding:28px 0 14px" width="272" id="hplogo"><br><br></div><form action="/search" name="f"><table cellpadding="0" cellspacing="0"><tr valign="top"><td width="25%">&nbsp;</td><td align="center" nowrap=""><input name="ie" value="ISO-8859-1" type="hidden"><input value="en-SG" name="hl" type="hidden"><input name="source" type="hidden" value="hp"><input name="biw" type="hidden"><input name="bih" type="hidden"><div class="ds" style="height:32px;margin:4px 0"><input class="lst" style="color:#000;margin:0;padding:5px 8px 0 6px;vertical-align:top" autocomplete="off" value="" title="Google Search" maxlength="2048" name="q" size="57"></div><br style="line-height:0"><span class="ds"><span class="lsbb"><input class="lsb" value="Google Search" name="btnG" type="submit"></span></span><span class="ds"><span class="lsbb"><input class="lsb" id="tsuid1" value="I'm Feeling Lucky" name="btnI" type="submit"><script nonce="ZTBftgaDXqVkRsgkXfC+IQ==">(function(){var id='tsuid1';document.getElementById(id).onclick = function(){if (this.form.q.value){this.checked = 1;if (this.form.iflsig)this.form.iflsig.disabled = false;}
else top.location='/doodles/';};})();</script><input value="AAP1E1EAAAAAXiLb-YdPM1JES0x9uS5Vyby5PyEBbkRS" name="iflsig" type="hidden"></span></span></td><td class="fl sblc" align="left" nowrap="" width="25%"><a href="/advanced_search?hl=en-SG&amp;authuser=0">Advanced search</a></td></tr></table><input id="gbv" name="gbv" type="hidden" value="1"><script nonce="ZTBftgaDXqVkRsgkXfC+IQ==">(function(){var a,b="1";if(document&&document.getElementById)if("undefined"!=typeof XMLHttpRequest)b="2";else if("undefined"!=typeof ActiveXObject){var c,d,e=["MSXML2.XMLHTTP.6.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"];for(c=0;d=e[c++];)try{new ActiveXObject(d),b="2"}catch(h){}}a=b;if("2"==a&&-1==location.search.indexOf("&gbv=2")){var f=google.gbvu,g=document.getElementById("gbv");g&&(g.value=a);f&&window.setTimeout(function(){location.href=f},0)};}).call(this);</script></form><div id="gac_scont"></div><div style="font-size:83%;min-height:3.5em"><br><div id="gws-output-pages-elements-homepage_additional_languages__als"><style>#gws-output-pages-elements-homepage_additional_languages__als{font-size:small;margin-bottom:24px}#SIvCob{display:inline-block;line-height:28px;}#SIvCob a{padding:0 3px;}.H6sW5{display:inline-block;margin:0 2px;white-space:nowrap}.z4hgWe{display:inline-block;margin:0 2px}</style><div id="SIvCob">Google offered in:  <a href="https://www.google.com/setprefs?sig=0_OhGkQsBJt6jEEOwcIX029n24GeU%3D&amp;hl=zh-CN&amp;source=homepage&amp;sa=X&amp;ved=0ahUKEwilvMWT6YznAhVSXSsKHcPKDz4Q2ZgBCAU">&#20013;&#25991;(&#31616;&#20307;)</a>    <a href="https://www.google.com/setprefs?sig=0_OhGkQsBJt6jEEOwcIX029n24GeU%3D&amp;hl=ms&amp;source=homepage&amp;sa=X&amp;ved=0ahUKEwilvMWT6YznAhVSXSsKHcPKDz4Q2ZgBCAY">Melayu</a>    <a href="https://www.google.com/setprefs?sig=0_OhGkQsBJt6jEEOwcIX029n24GeU%3D&amp;hl=ta&amp;source=homepage&amp;sa=X&amp;ved=0ahUKEwilvMWT6YznAhVSXSsKHcPKDz4Q2ZgBCAc">&#2980;&#2990;&#3007;&#2996;&#3021;</a>  </div></div></div><span id="footer"><div style="font-size:10pt"><div style="margin:19px auto;text-align:center" id="fll"><a href="/intl/en/ads/">Advertising�Programs</a><a href="http://www.google.com.sg/intl/en/services/">Business Solutions</a><a href="/intl/en/about.html">About Google</a><a href="https://www.google.com/setprefdomain?prefdom=SG&amp;prev=https://www.google.com.sg/&amp;sig=K_9SvNW9q-KJlRNuumDK3kLISEUBI%3D">Google.com.sg</a></div></div><p style="color:#767676;font-size:8pt">&copy; 2020 - <a href="/intl/en/policies/privacy/">Privacy</a> - <a href="/intl/en/policies/terms/">Terms</a></p></span></center><script nonce="ZTBftgaDXqVkRsgkXfC+IQ==">(function(){window.google.cdo={height:0,width:0};(function(){var a=window.innerWidth,b=window.innerHeight;if(!a||!b){var c=window.document,d="CSS1Compat"==c.compatMode?c.documentElement:c.body;a=d.clientWidth;b=d.clientHeight}a&&b&&(a!=google.cdo.width||b!=google.cdo.height)&&google.log("","","/client_204?&atyp=i&biw="+a+"&bih="+b+"&ei="+google.kEI);}).call(this);})();(function(){var u='/xjs/_/js/k\x3dxjs.hp.en.T5-o3AVO7Mw.O/m\x3dsb_he,d/am\x3dAAMCbAQ/d\x3d1/rs\x3dACT90oFpqSl_J_b8g0YPG1qup7tSgAi2Tw';
setTimeout(function(){var b=document;var a="SCRIPT";"application/xhtml+xml"===b.contentType&&(a=a.toLowerCase());a=b.createElement(a);a.src=u;google.timers&&google.timers.load&&google.tick&&google.tick("load","xjsls");document.body.appendChild(a)},0);})();(function(){window.google.xjsu='/xjs/_/js/k\x3dxjs.hp.en.T5-o3AVO7Mw.O/m\x3dsb_he,d/am\x3dAAMCbAQ/d\x3d1/rs\x3dACT90oFpqSl_J_b8g0YPG1qup7tSgAi2Tw';})();function _DumpException(e){throw e;}
function _F_installCss(c){}
(function(){google.spjs=false;google.snet=true;google.em=[];google.emw=false;})();(function(){var pmc='{\x22d\x22:{},\x22sb_he\x22:{\x22agen\x22:true,\x22cgen\x22:true,\x22client\x22:\x22heirloom-hp\x22,\x22dh\x22:true,\x22dhqt\x22:true,\x22ds\x22:\x22\x22,\x22ffql\x22:\x22en\x22,\x22fl\x22:true,\x22host\x22:\x22google.com\x22,\x22isbh\x22:28,\x22jsonp\x22:true,\x22msgs\x22:{\x22cibl\x22:\x22Clear Search\x22,\x22dym\x22:\x22Did you mean:\x22,\x22lcky\x22:\x22I\\u0026#39;m Feeling Lucky\x22,\x22lml\x22:\x22Learn more\x22,\x22oskt\x22:\x22Input tools\x22,\x22psrc\x22:\x22This search was removed from your \\u003Ca href\x3d\\\x22/history\\\x22\\u003EWeb History\\u003C/a\\u003E\x22,\x22psrl\x22:\x22Remove\x22,\x22sbit\x22:\x22Search by image\x22,\x22srch\x22:\x22Google Search\x22},\x22ovr\x22:{},\x22pq\x22:\x22\x22,\x22refpd\x22:true,\x22rfs\x22:[],\x22sbpl\x22:16,\x22sbpr\x22:16,\x22scd\x22:10,\x22stok\x22:\x2237vYeWmt_tDPPGuImGiX2mRKVvc\x22,\x22uhde\x22:false}}';google.pmc=JSON.parse(pmc);})();</script>        </body></html>[centos@ip-10-0-10-47 ~]$
```

c) "telnet localhost 80"; 

```
Trying ::1...
Connected to localhost.
Escape character is '^]'.
```

d) "telnet localhost 8080"; 

```
Trying ::1...
Connected to localhost.
Escape character is '^]'.
```

e) "telnet localhost 3306";

```
Trying ::1...
Connected to localhost.
Escape character is '^]'.
J
```
