/*
 * Copyright (c) 2019-2023, JetBrains s.r.o. and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation. JetBrains designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact JetBrains, Na Hrebenech II 1718/10, Prague, 14000, Czech Republic
 * if you need additional information or have any questions.
 */

import org.gradle.api.Project
import org.gradle.api.tasks.JavaExec
import java.util.*

public fun Project.createRunIdeaTask(
  name: String,
  isAgent: Boolean,
  localProperties: Properties,
  configuration: JavaExec.() -> Unit,
) {

  val ideaPath = localProperties["projectorLauncher.ideaPath"] as? String
  println("----------- $name config ---------------")
  println("Idea path: $ideaPath")
  println("------------------------------------------------")
  if (ideaPath == null) return

  val ideaLib = "$ideaPath/lib"
  val ideaClassPath = listOf(
    "app.jar",
    "3rd-party-rt.jar",
    "util.jar",
    "util_rt.jar",
    "util-8.jar",
    "jps-model.jar",
    "stats.jar",
    "protobuf.jar",
    "external-system-rt.jar",
    "intellij-test-discovery.jar",
    "forms_rt.jar",
    "rd.jar",
    "externalProcess-rt.jar",
    "annotations-java5.jar",
    "annotations.jar",
    "async-profiler-windows.jar",
    "async-profiler.jar",
    "byte-buddy-agent.jar",
    "error-prone-annotations.jar",
    "groovy.jar",
    "idea_rt.jar",
    "intellij-coverage-agent-1.0.706.jar",
    "jsch-agent.jar",
    "junit.jar",
    "junit4.jar",
    "ant/lib/ant.jar"
  ).joinToString(":", prefix = ":") { "$ideaLib/$it" }

  val jdkHome = System.getProperty("java.home")

  println("JDK home dir: $jdkHome")

  val ideaPathsSelector = "IntelliJIdea2023.1"

  val (classToLaunchProperty, launcherClassName) = getLaunchingSetup(isAgent)

  createRunProjectorTask(name, classToLaunchProperty, "com.intellij.idea.Main", launcherClassName) {
    classpath(ideaClassPath, "$jdkHome/../lib/tools.jar")

    jvmArgs(
      "-Didea.paths.selector=$ideaPathsSelector",
      "-Didea.vendor.name=ProjectorVendor",
      "-Didea.jre.check=true",
      "-Didea.is.internal=true",
    )

    if (isIdeVersionAtLeast(ideaPath, "212")) { // appeared in 211, became default in 212, mandatory in 221
      jvmArgs("-Djava.system.class.loader=com.intellij.util.lang.PathClassLoader")
    }

    jvmArgs("-Didea.platform.prefix=Idea") // This is required for IDE to determine proper file locations

    configuration()
  }
}
