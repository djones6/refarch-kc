(window.webpackJsonp=window.webpackJsonp||[]).push([[30],{ikSW:function(e,t,n){"use strict";n.r(t),n.d(t,"_frontmatter",(function(){return l})),n.d(t,"default",(function(){return i}));n("91GP"),n("rGqo"),n("yt8O"),n("Btvt"),n("RW0V"),n("q1tI");var o=n("7ljp"),r=n("013z");n("qKvR");function a(){return(a=Object.assign||function(e){for(var t=1;t<arguments.length;t++){var n=arguments[t];for(var o in n)Object.prototype.hasOwnProperty.call(n,o)&&(e[o]=n[o])}return e}).apply(this,arguments)}var l={},c={_frontmatter:l},b=r.a;function i(e){var t=e.components,n=function(e,t){if(null==e)return{};var n,o,r={},a=Object.keys(e);for(o=0;o<a.length;o++)n=a[o],t.indexOf(n)>=0||(r[n]=e[n]);return r}(e,["components"]);return Object(o.b)(b,a({},c,n,{components:t,mdxType:"MDXLayout"}),Object(o.b)("p",null,"To be able to build and execute the solution, you need to do the following tasks:"),Object(o.b)("h2",null,"Get a Git client"),Object(o.b)("p",null,"If not already done, get a git client. See the following ",Object(o.b)("a",a({parentName:"p"},{href:"https://git-scm.com/book/en/v2/Getting-Started-Installing-Git"}),"installation instructions"),". "),Object(o.b)("p",null,"On a Centos box we did:"),Object(o.b)("pre",null,Object(o.b)("code",a({parentName:"pre"},{}),"yum install git\n")),Object(o.b)("h2",null,"Clone all the repositories"),Object(o.b)("p",null,"Start by cloning the root repository using the command:"),Object(o.b)("pre",null,Object(o.b)("code",a({parentName:"pre"},{}),"git clone https://github.com/ibm-cloud-architecture/refarch-kc/\n")),Object(o.b)("p",null,"Then go to the ",Object(o.b)("inlineCode",{parentName:"p"},"refarch-kc")," folder and use the command:"),Object(o.b)("pre",null,Object(o.b)("code",a({parentName:"pre"},{}),"./script/clone.sh\n")),Object(o.b)("p",null,"to get all the solution repositories. You should have at least the following repositories:"),Object(o.b)("pre",null,Object(o.b)("code",a({parentName:"pre"},{}),"refarch-kc-container-ms\nrefarch-kc-order-ms\nrefarch-kc-ui\nrefarch-kc\nrefarch-kc-ms\nrefarch-kc-streams\n")),Object(o.b)("h2",null,"Get docker"),Object(o.b)("p",null,"Get ",Object(o.b)("a",a({parentName:"p"},{href:"https://docs.docker.com/install/"}),"docker engine and install")," it (if not yet done). To verify docker runs fine use the command ",Object(o.b)("inlineCode",{parentName:"p"},"docker version"),". We run on v19.03 community edition."),Object(o.b)("p",null,"or use one of the packaged solution like on Centos:"),Object(o.b)("pre",null,Object(o.b)("code",a({parentName:"pre"},{}),"yum install docker\n")),Object(o.b)("h2",null,"Verifying current environment"),Object(o.b)("p",null,"To assess the tools installed on your computer, run the following command under the ",Object(o.b)("inlineCode",{parentName:"p"},"refarch-kc")," project:"),Object(o.b)("pre",null,Object(o.b)("code",a({parentName:"pre"},{}),"./scripts/prepareEnv\n")),Object(o.b)("p",null,"The script will create the docker images for maven, nodejs, and python if those tools are not found on your computer. The images are built from our docker files you can find under the ",Object(o.b)("inlineCode",{parentName:"p"},"refarch-kc/dockers")," folder."),Object(o.b)("pre",null,Object(o.b)("code",a({parentName:"pre"},{}),"docker images\n")),Object(o.b)("pre",null,Object(o.b)("code",a({parentName:"pre"},{}),"REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE\nibmcase/python      latest              8d38aefd0346        2 minutes ago       1.14 GB\nibmcase/nodetools   latest              7a736a07ba09        2 minutes ago       959 MB\nibmcase/javatools   latest              bdf79f64d721        23 minutes ago      715 MB\n\n")),Object(o.b)("p",null,"You to have two choices to build the solution: "),Object(o.b)("ol",null,Object(o.b)("li",{parentName:"ol"},"installing node, python and maven on your computer"),Object(o.b)("li",{parentName:"ol"},"use our own docker images for running those tools")),Object(o.b)("p",null,"You can mix the two. If, for example, you already developed with Nodejs or Java you may want to leverage your own configurations. If you do not want to impact your python environment, you can user our docker images. "),Object(o.b)("p",null,"To be able to build without our docker images do the following:"),Object(o.b)("h2",null,"Get Java"),Object(o.b)("p",null,"Do something like this:"),Object(o.b)("pre",null,Object(o.b)("code",a({parentName:"pre"},{}),"yum install java-1.8.0-openjdk-devel\n")),Object(o.b)("h2",null,"Get Maven"),Object(o.b)("p",null,"get ",Object(o.b)("a",a({parentName:"p"},{href:"https://maven.apache.org/install.html"}),"maven")," and add it to your PATH."),Object(o.b)("p",null,"or for a Centos linux:"),Object(o.b)("pre",null,Object(o.b)("code",a({parentName:"pre"},{}),"yum install maven\n")),Object(o.b)("h2",null,"Get nodejs"),Object(o.b)("p",null,"Get ",Object(o.b)("a",a({parentName:"p"},{href:"https://nodejs.org/en/"}),"node and npm")),Object(o.b)("p",null,"or for a Centos linux:"),Object(o.b)("pre",null,Object(o.b)("code",a({parentName:"pre"},{}),"yum install node\n")),Object(o.b)("h2",null,"Get Python 3.7"),Object(o.b)("p",null,"Our integration tests are done in python. To avoid impacting your own python environment, we defined a docker file to build an image with the necessary python library. The image may have been already built with the ",Object(o.b)("inlineCode",{parentName:"p"},"preparenv")," script run in previous step."),Object(o.b)("p",null,"If you want to rebuild it, go to the ",Object(o.b)("inlineCode",{parentName:"p"},"docker")," folder and run the following command: "),Object(o.b)("pre",null,Object(o.b)("code",a({parentName:"pre"},{}),"docker build -f docker-python-tools -t ibmcase/python .\n")),Object(o.b)("h2",null,"Global environment settings"),Object(o.b)("p",null,"In the ",Object(o.b)("inlineCode",{parentName:"p"},"refarch-kc")," rename ",Object(o.b)("inlineCode",{parentName:"p"},"./script/setenv.sh.tmpl")," to ",Object(o.b)("inlineCode",{parentName:"p"},"./script/setenv.sh"),":"),Object(o.b)("pre",null,Object(o.b)("code",a({parentName:"pre"},{}),"mv setenv.sh.tmpl setenv.sh\n")),Object(o.b)("p",null,"Then modify the environment variables according to your environment you are using. This file is used by a lot of scripts in the solution to set the target deployment environment: LOCAL, IBMCLOUD, ICP, MINIKUBE."))}i.isMDXComponent=!0}}]);
//# sourceMappingURL=component---src-pages-pre-requisites-mdx-47fcb1469b613b8f1048.js.map