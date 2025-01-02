module.exports = (res, codeStatus, error) => {
    res.status(codeStatus).json({
        success: false,
        message: error.message ? error.message : error
    })
}