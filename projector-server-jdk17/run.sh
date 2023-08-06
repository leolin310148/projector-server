
IDE_PATH="/Users/puni/Downloads/IntelliJ IDEA 2023.1.5.app/Contents"

CLASS_PATH=""
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/app.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/3rd-party-rt.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/util.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/util_rt.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/util-8.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/jps-model.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/stats.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/protobuf.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/external-system-rt.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/intellij-test-discovery.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/forms_rt.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/rd.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/externalProcess-rt.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/annotations-java5.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/annotations.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/async-profiler-windows.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/async-profiler.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/byte-buddy-agent.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/error-prone-annotations.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/groovy.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/idea_rt.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/intellij-coverage-agent-1.0.706.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/jsch-agent.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/junit.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/junit4.jar"
CLASS_PATH="$CLASS_PATH:$IDE_PATH/lib/ant/lib/ant.jar"

exec "$IDE_PATH/jbr/Contents/Home/bin/java" \
  -cp "$CLASS_PATH:/Users/puni/IdeaProjects/projector-server/projector-server-jdk17/build/distributions/projector-server-jdk17-1.8.1/lib/*" \
  --add-opens=java.base/java.io=ALL-UNNAMED \
  --add-opens=java.base/java.lang=ALL-UNNAMED \
  --add-opens=java.base/java.lang.ref=ALL-UNNAMED \
  --add-opens=java.base/java.lang.reflect=ALL-UNNAMED \
  --add-opens=java.base/java.net=ALL-UNNAMED \
  --add-opens=java.base/java.nio=ALL-UNNAMED \
  --add-opens=java.base/java.nio.charset=ALL-UNNAMED \
  --add-opens=java.base/java.text=ALL-UNNAMED \
  --add-opens=java.base/java.time=ALL-UNNAMED \
  --add-opens=java.base/java.util=ALL-UNNAMED \
  --add-opens=java.base/java.util.concurrent=ALL-UNNAMED \
  --add-opens=java.base/java.util.concurrent.atomic=ALL-UNNAMED \
  --add-opens=java.base/jdk.internal.vm=ALL-UNNAMED \
  --add-opens=java.base/sun.nio.ch=ALL-UNNAMED \
  --add-opens=java.base/sun.nio.fs=ALL-UNNAMED \
  --add-opens=java.base/sun.security.ssl=ALL-UNNAMED \
  --add-opens=java.base/sun.security.util=ALL-UNNAMED \
  --add-opens=java.base/sun.net.dns=ALL-UNNAMED \
  --add-opens=java.desktop/com.apple.eawt=ALL-UNNAMED \
  --add-opens=java.desktop/com.apple.eawt.event=ALL-UNNAMED \
  --add-opens=java.desktop/com.apple.laf=ALL-UNNAMED \
  --add-opens=java.desktop/java.awt=ALL-UNNAMED \
  --add-opens=java.desktop/java.awt.dnd.peer=ALL-UNNAMED \
  --add-opens=java.desktop/java.awt.event=ALL-UNNAMED \
  --add-opens=java.desktop/java.awt.image=ALL-UNNAMED \
  --add-opens=java.desktop/java.awt.peer=ALL-UNNAMED \
  --add-opens=java.desktop/java.awt.font=ALL-UNNAMED \
  --add-opens=java.desktop/javax.swing=ALL-UNNAMED \
  --add-opens=java.desktop/javax.swing.plaf.basic=ALL-UNNAMED \
  --add-opens=java.desktop/javax.swing.text.html=ALL-UNNAMED \
  --add-opens=java.desktop/sun.awt.datatransfer=ALL-UNNAMED \
  --add-opens=java.desktop/sun.awt.image=ALL-UNNAMED \
  --add-opens=java.desktop/sun.awt=ALL-UNNAMED \
  --add-opens=java.desktop/sun.font=ALL-UNNAMED \
  --add-opens=java.desktop/sun.java2d=ALL-UNNAMED \
  --add-opens=java.desktop/sun.lwawt=ALL-UNNAMED \
  --add-opens=java.desktop/sun.lwawt.macosx=ALL-UNNAMED \
  --add-opens=java.desktop/sun.swing=ALL-UNNAMED \
  --add-opens=jdk.attach/sun.tools.attach=ALL-UNNAMED \
  --add-opens=jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED \
  --add-opens=jdk.internal.jvmstat/sun.jvmstat.monitor=ALL-UNNAMED \
  --add-opens=jdk.jdi/com.sun.tools.jdi=ALL-UNNAMED \
  -Djava.system.class.loader=com.intellij.util.lang.PathClassLoader \
  -Didea.strict.classpath=true \
  -Didea.vendor.name=JetBrains \
  -Didea.paths.selector=IntelliJIdea2023.1 \
  -Didea.platform.prefix=Idea \
  -Didea.jre.check=true \
  -Djna.boot.library.path="$IDE_PATH/lib/jna/amd64" \
  -Dpty4j.preferred.native.folder="$IDE_PATH/lib/pty4j" \
  -Djna.nosys=true \
  -Djna.noclasspath=true \
  -Dsplash=true \
  -DORG_JETBRAINS_PROJECTOR_SERVER_PORT=10001 \
  -Dorg.jetbrains.projector.server.classToLaunch=com.intellij.idea.Main \
  org.jetbrains.projector.server.ProjectorLauncher\
