class DocsController < ApplicationController

    before_action :find_doc, only: [:show, :edit, :update, :destroy]

    def index
        @docs = Doc.all.order('created_at DESC')
    end

    def show
        #before action takes care of this action
        #find_doc
    end

    def new
        # @doc = Doc.new #before devise
        @doc = current_user.docs.build # after devise
    end

    def create
        # @doc = Doc.new(doc_params)
        @doc = current_user.docs.build(doc_params) # after devise

        if @doc.save
            redirect_to @doc
        else
            render 'new'
        end
    end

    def edit
        #before action takes care of this action
        #find_doc
    end

    def update
        if @doc.update(doc_params)
            redirect_to @doc
        else
            render 'edit'
        end
    end

    def destroy
        @doc.destroy
        redirect_to docs_path
    end

    private

    def find_doc
        @doc = Doc.find(params[:id])
    end

    def doc_params
        params.require(:doc).permit(:title, :content)
    end
end
