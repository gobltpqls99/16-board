const isUser = (req, res, next) => {
	if (req.session.user) next();
	else next('')
}
const isGuest = (req, res, next) => {

}

module.exports = { isUser, isGuest }