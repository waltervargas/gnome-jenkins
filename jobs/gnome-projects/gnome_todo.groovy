def project = [
  name: "gnome-todo",
  git_url: "https://github.com/waltervargas/gnome-todo"
]

multibranchPipelineJob(project.name) {
  // triggers {
  //   scm('H * * * *')
  // }
  branchSources {
    git {
      remote(project.git_url)
    }
  }
}
