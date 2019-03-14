class DocsController < ApplicationController

    def index

    end

    def show

    end

    def new

    end

    def create

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def find_doc

    end

    def doc_params
        params.require(:docs).permit(:title, :content)
    end
end
