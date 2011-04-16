package org.nigajuan.domain;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;

/**
 * Created by IntelliJ IDEA.
 * User: nigajuan
 * Date: 06/04/11
 * Time: 21:12
 * To change this template use File | Settings | File Templates.
 */
public class Comment {


    @NotNull
    private Long postId;

    @NotEmpty
    private String author;


    @NotEmpty
    private String comment;


    public Long getPostId() {
        return postId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
