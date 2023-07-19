const String getAllBlogsQuery = '''
query allBlogPosts {
  allBlogPosts{
    id
    title
    subTitle
    body
    dateCreated
  }
}

''';



const createblogMutation = """
mutation createBlog(\$title: String!, \$subTitle: String!, \$body: String!) {
  createBlog(title: \$title, subTitle: \$subTitle, body: \$body) {
    success
    blogPost{
      id
      title
      subTitle
      body
      dateCreated
    }
  }
}

""";



const updateUserMutation = """
mutation(\$id: Int, \$name: String, \$email: String, \$job_title: String) {
    updateUserInfo (id: \$id, name: \$name, email: \$email, job_title: \$job_title)
  }

""";

const updateBlogMutation = """
mutation updateBlog(\$blogId: String!, \$title: String, \$subTitle: String, \$body: String) {
  updateBlog(blogId: \$blogId, title: \$title, subTitle: \$subTitle, body: \$body) {
    success
    blogPost{
      id
      title
      subTitle
      body
      dateCreated
    }
  }
}
  
""";



// mutation updateBlog($blogId: String!, $title: String, $subTitle: String, $body: String) {
//   updateBlog(blogId: $blogId, title: $title, subTitle: $subTitle, body: $body) {
//     success
//     blogPost{
//       id
//       title
//       subTitle
//       body
//       dateCreated
//     }
//   }
// }



const String getblogPost = '''
query blogPost(\$blogId: String!) {
  blogPost(blogId: \$blogId) {
    id
    title
    subTitle
    body
    dateCreated
  }
}

''';


const deleteBlogMutation = """
mutation deleteBlog(\$blogId: String!) {
  deleteBlog(blogId: \$blogId) {
    success
  }
}


""";


// const deleteUSerMutation = """
// mutation(\$id: Int) {
//     deleteUser(id: \$id)
//   }

// """;

// mutation deleteBlog($blogId: String!) {
//   deleteBlog(blogId: $blogId) {
//     success
//   }
// }



// query blogPost($blogId: String!) {
//   blogPost(blogId: "1") {
//     id
//     title
//     subTitle
//     body
//     dateCreated
//   }
// }